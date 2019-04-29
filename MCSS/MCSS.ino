#include "arduino2.h"
#include <Arduino.h>
#include <stdint.h>

#include <SPI.h>

#define USE_LONG_FILE_NAMES 0
#define USE_SEPARATE_FAT_CACHE 1

#include <SdFat.h>
#include <SdFatUtil.h>

#include <SFEMP3Shield.h>
#include <SFEMP3ShieldConfig.h>
#include <SFEMP3Shieldmainpage.h>

#define MP3_SONG_VOLUME 25

#include <MOVIShield.h>

#include <LiquidCrystal595.h>
#include "Format16x2String.h";

#include "GMECM1228079.h"

#include "sample_data.h"

LiquidCrystal595 lcd(46,47,48);     // datapin, latchpin, clockpin

/*
// These values work "okay" when Adafruit mic is set to 60db gain, but that gain causes it to
// amplify some sort of rapid clicking/buzz when RPM exceeds about 1000 RPM.
#define DEFAULT_MOVI_THRESHOLD_ZERO_RPM 9
#define DEFAULT_MOVI_THRESHOLD_LOW_RPM 20
#define DEFAULT_MOVI_THRESHOLD_HIGH_RPM 24 */

// Attempt at optimizing thresholds for Adafruit mic gain of 50db
#define DEFAULT_MOVI_THRESHOLD_ZERO_RPM 3
#define DEFAULT_MOVI_THRESHOLD_LOW_RPM 10
#define DEFAULT_MOVI_THRESHOLD_HIGH_RPM 11

#define RPM_ZERO 0
#define RPM_LOW 1200

uint8_t MOVI_THRESHOLD = DEFAULT_MOVI_THRESHOLD_ZERO_RPM;
uint8_t MOVI_MICDEBUG = 0;

MOVI movi(false, &Serial1);
unsigned long MOVI_callsign_millis = 0;
String MOVI_last_words;
char MOVI_last_words_trained[64];

SdFat sd;
SFEMP3Shield mp3;
uint8_t song_playing = 0;

GMECM ecm;

uint32_t checksum_errors = 0;
uint32_t refresh_errors = 0;

int8_t display_lock = -1;
int8_t display_current = -1;

unsigned long currentMillis = 0;

#define REFRESH_FREQ_MILLIS 200
unsigned long last_refresh_millis = 0;

#define CYCLE_DISPLAY_MILLIS 2000
unsigned long last_cycle_display_millis = 0;
#define UPDATE_DISPLAY_MILLIS 250
unsigned long last_update_display_millis = 0;
#define CHECK_SIGNAL_MILLIS 100
unsigned long last_check_signal_millis = 0;
#define CHECK_FLUIDS_MILLIS 1000
unsigned long last_check_fluids_millis = 0;

#define VR_USE_SI 1

enum VR_MODE { VR_MODE_AWAITING_TRIGGER, VR_MODE_SPEAKING_TRIGGER, VR_MODE_AWAITING_COMMAND, VR_MODE_AWAITING_SECONDARY_TRIGGER };

uint8_t vr_mode = VR_MODE_AWAITING_TRIGGER;

struct VR_ACTION {
   int8_t lcd_page;
   char intro_MP3[13];
   int8_t ecm_value;
   char suffix_MP3[13];
   int8_t special_case;
};

enum VR_SPECIAL_CASE { VR_SPECIAL_CASE_TPS = 1, VR_SPECIAL_CASE_LOOP_STATUS = 2, VR_SPECIAL_CASE_MALF = 3, VR_SPECIAL_CASE_ERRORS = 4,
                       VR_SPECIAL_CASE_FAVOURITE_SONG = 5, VR_SPECIAL_CASE_CANCEL = 6, VR_SPECIAL_CASE_RANDOM_SONG = 7, VR_SPECIAL_CASE_SENSOR = 8 };

#define MAX_VR_COMMAND 20

const char MOVI_sentence_0[] PROGMEM = "OKAYMONTEECARLOW";
const char MOVI_sentence_1[] PROGMEM = "SPEED";
const char MOVI_sentence_2[] PROGMEM = "RPM";
const char MOVI_sentence_3[] PROGMEM = "THROTTLE";
const char MOVI_sentence_4[] PROGMEM = "LOOP STATUS";
const char MOVI_sentence_5[] PROGMEM = "FLUIDS";
const char MOVI_sentence_6[] PROGMEM = "OXYGEN";
const char MOVI_sentence_7[] PROGMEM = "PRESSURE";
const char MOVI_sentence_8[] PROGMEM = "TEMPERATURE";
const char MOVI_sentence_9[] PROGMEM = "BATTERY";
const char MOVI_sentence_10[] PROGMEM = "DUTY CYCLE";
const char MOVI_sentence_11[] PROGMEM = "SPARK ADVANCE";
const char MOVI_sentence_12[] PROGMEM = "KNOCKS";
const char MOVI_sentence_13[] PROGMEM = "CYCLE DISPLAY";
const char MOVI_sentence_14[] PROGMEM = "TROUBLE CODES";
const char MOVI_sentence_15[] PROGMEM = "ERRORS";
const char MOVI_sentence_16[] PROGMEM = "MAXIMUMS";
const char MOVI_sentence_17[] PROGMEM = "AVERAGES";
const char MOVI_sentence_18[] PROGMEM = "FAVOURITE SONG";
const char MOVI_sentence_19[] PROGMEM = "RANDOM SONG";
const char MOVI_sentence_20[] PROGMEM = "CANCEL";
const char MOVI_sentence_21[] PROGMEM = "";

const char * const MOVI_sentence_table[] PROGMEM =
{   
  MOVI_sentence_0, MOVI_sentence_1, MOVI_sentence_2, MOVI_sentence_3,
  MOVI_sentence_4, MOVI_sentence_5, MOVI_sentence_6, MOVI_sentence_7,
  MOVI_sentence_8, MOVI_sentence_9, MOVI_sentence_10, MOVI_sentence_11,
  MOVI_sentence_12, MOVI_sentence_13, MOVI_sentence_14, MOVI_sentence_15,
  MOVI_sentence_16, MOVI_sentence_17, MOVI_sentence_18, MOVI_sentence_19,
  MOVI_sentence_20, MOVI_sentence_21
};

const VR_ACTION vr_action[MAX_VR_COMMAND] = 
                                  { { /* 0 = SPEED */ LCD_PAGE_SPEED, "SPEED1.MP3", VALUE_MPH, "SPEED2.MP3", 0 },
                                  { /* 1 = RPM */ LCD_PAGE_SPEED, "RPM1.MP3", VALUE_RPM, "RPM2.MP3", 0 },
                                  { /* 2 = THROTTLE */ LCD_PAGE_THROTTLE, "TPS1.MP3", VALUE_TPS, "TPS2.MP3", VR_SPECIAL_CASE_TPS },
                                  { /* 3 = LOOP_STATUS */ LCD_PAGE_LOOP_STATUS, "LOOP1.MP3", VALUE_CLOSED_LOOP, "LOOP2.MP3", VR_SPECIAL_CASE_LOOP_STATUS},
                                  { /* 4 = FLUIDS */ LCD_PAGE_FLUIDS, "FUEL1.MP3", VALUE_FUEL_LEVEL, "FUEL2.MP3", VR_SPECIAL_CASE_SENSOR},
                                  { /* 5 = O2 */ LCD_PAGE_MIX, "AIRFUEL1.MP3", VALUE_O2, "AIRFUEL2.MP3", 0 },
                                  { /* 6 = PRESSURE */ LCD_PAGE_PRESSURE, "MAP1.MP3", VALUE_MAP, "MAP2.MP3", 0 },
                                  { /* 7 = COOLANT */ LCD_PAGE_COOL_BATT, "COOLANT1.MP3", VALUE_COOL_TEMP, "COOLANT2.MP3", 0 },
                                  { /* 8 = BATTERY */ LCD_PAGE_COOL_BATT, "BATTERY1.MP3", VALUE_BATT_V, "BATTERY2.MP3", 0 },
                                  { /* 9 = SOLENOIDS */ LCD_PAGE_DUTY_CYCLE, "MCS1.MP3", VALUE_MCS_DUTY, "MCS2.MP3", 0},
                                  { /*10 = SPARK_ADVANCE */ LCD_PAGE_SA, "SA1.MP3", VALUE_FINAL_SA, "SA2.MP3", 0},
                                  { /*11 = KNOCKS */ LCD_PAGE_KNOCK, "KNOCK1.MP3", VALUE_KNOCK, "KNOCK2.MP3", 0},
                                  { /*12 = CYCLE_DISPLAY*/ -1, "ACK.MP3", -1, "", 0},
                                  { /*13 = TROUBLE_CODES */ LCD_PAGE_MALF, "MALF", VALUE_MALF, "", VR_SPECIAL_CASE_MALF},
                                  { /*14 = ERRORS */ MAX_GMECM_LCD_PAGE, "CS1.MP3", -1, "CS2.MP3", VR_SPECIAL_CASE_ERRORS },
                                  { /*15 = MAXIMUMS - not yet implemented */ -1, "", -1, "", 0 },
                                  { /*16 = AVERAGES - not yet implemented */ -1, "", -1, "", 0 },
                                  { /*17 = FAVOURITE_SONG - not yet implemented */ -2, "", -1, "", VR_SPECIAL_CASE_FAVOURITE_SONG },
                                  { /*18 = RANDOM_SONG - not yet implemented */ -2, "", -1, "", VR_SPECIAL_CASE_RANDOM_SONG },
                                  { /*19 = CANCEL - not yet implemented */ -1, "ACK.MP3", -1, "", VR_SPECIAL_CASE_CANCEL } };

uint8_t responding_to_command = -1;
uint8_t responding_to_command_step = -1;
uint8_t announce_wot = 0;
uint8_t announced_wot = 0;
unsigned long last_announced_wot = 0;
uint8_t announce_closed_loop = 0;
uint8_t announced_closed_loop = 0;

uint32_t announced_MALF = 0;

uint8_t announced_low_fuel = 0;

double last_run_time = 0.0;

int8_t lcdCursorLocation = -1;


void MOVI_reset() {
  Serial.println("Resetting MOVI");
  movi.stopDialog();
  movi.restartDialog();
}

void update_lcd_values() {

  lcd.noCursor();
  
  if (display_current == MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,1);
    lcd.print(Format16x2String(String(checksum_errors) + '/' + String(refresh_errors), String(ecm.lastRefreshCount)));
  } else if (display_current < MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,1);
    lcd.print(ecm.lcdPage[display_current].getValueString());
  }
  if (lcdCursorLocation >= 0) {
    lcd.setCursor(lcdCursorLocation, 0);
    lcd.cursor();
  }

}

void update_lcd() {

  lcd.noCursor();

  if (display_current == MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,0);
    lcd.print(Format16x2String(F("ERRORS"), F("RESPONSE")));
  } else if (display_current < MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,0);
    lcd.print(ecm.lcdPage[display_current].getTitleBar());
  }
  update_lcd_values();      

}

String number_path(long n) {

  String tmpString = String(F("NUMBERS/"));
  tmpString = tmpString + (n / 1000);
  tmpString = tmpString + F("/");
  if (n < 1000) tmpString = tmpString + F("0");
  tmpString = tmpString + (n / 100);
  tmpString = tmpString + F("/");
  tmpString = tmpString + n; 
  return tmpString;
}

uint8_t refresh_SRAM() {
  uint8_t refreshSuccess;
  
  if (currentMillis - last_refresh_millis > REFRESH_FREQ_MILLIS) {

    last_refresh_millis = currentMillis;
  
    refreshSuccess = ecm.refresh();
  
    if (refreshSuccess == ERROR_CHECKSUM) {
      #ifndef DISCONNECTED_MODE
        ++checksum_errors;
      
        Serial.println(F("Error - Checksum mismatch!"));
      #endif
    } else if (refreshSuccess == ERROR_REFRESH_COUNT) {
      #ifndef DISCONNECTED_MODE
      ++refresh_errors;
      Serial.println(F("Error - Refresh count!"));
      #endif
    }
  }

  return refreshSuccess;
}

void update_lcd_while_talking() {
  while (mp3.isPlaying()) {
    currentMillis = millis();
    if (currentMillis - last_refresh_millis > REFRESH_FREQ_MILLIS) {
      if (refresh_SRAM() == 0) {
        if (currentMillis - last_update_display_millis > UPDATE_DISPLAY_MILLIS  && display_current >= 0) update_lcd_values();
      }
    }
    delay(5);
  }
}

void say(const String& s) {
  int movi_res;
  
  Serial.print("begin say: ");
  Serial.println(s);

  movi.setThreshold(95);
  while((movi_res = movi.poll()) != 0) {
    Serial.print(F("movi.poll() = "));
    Serial.println(movi_res);
  }
/*  uint8_t i;
  for (i = 0; i < 10; ++i) {
    if (movi.sendCommand(F("THRESHOLD"), F("95"), "1")) break;
  }
  Serial.print(F("setThreshold returned true after tries :"));
  Serial.println(i+1);
*/
  
  if (mp3.isPlaying()) mp3.stopTrack();
  
  /* Need to compensate for the MP3 library's lack of the use of "const". */
  /* They don't actually modify the string, but we can't just call playMP3 without the clumsy cast */
  mp3.playMP3((char *)(s.c_str()));
  while (mp3.isPlaying()) update_lcd_while_talking();

//  MOVI_reset();
  movi.setThreshold(MOVI_THRESHOLD);
  while ((movi_res = movi.poll()) != 0) {
      Serial.print(F("movi.poll() = "));
      Serial.println(movi_res);
  }
  
  Serial.print("end say: ");
  Serial.println(s);

}

void say_number(const String& s) {
  String tmpString = s;
  tmpString.trim();
  if (isdigit(tmpString[0])) {
    tmpString = number_path(tmpString.toInt()) + F(".MP3");
    say(tmpString);
    
    long point = s.indexOf('.');
    if (point >= 0) {
      say(F("POINT.MP3"));
      tmpString = number_path(s.substring(point+1).toInt()) + F(".MP3");
      say(tmpString);
    }
  
  } else {
    say(tmpString + F(".MP3"));
  }
}

void sayMALF(int value_index) {
  Serial.println(F("begin MALF"));
  Serial.print(F("getValueString() = "));
  Serial.println(ecm.ecmValue[value_index].getValueString());

  String valueString(ecm.ecmValue[value_index].getValueString());
  valueString.trim();
  if (!(valueString.compareTo(F("NONE")))) {
    Serial.println(F("no MALF to report")); 
    say(F("MALF/MALF0.MP3"));
  } else {
    Serial.println(F("reporting MALFs")); 
    say(F("MALF/MALF1.MP3"));
    String tmpString = valueString;
    while (tmpString.length() > 0) {
      say(number_path(tmpString.toInt()) + F(".MP3"));
      say(String(F("MALF/MALF")) + tmpString.toInt() + F(".MP3"));
      long comma = tmpString.indexOf(',');
      if (comma >= 0) tmpString = tmpString.substring(comma+1);
      else tmpString = F("");
    }
  }
  announced_MALF = ecm.ecmValue[value_index].decodeValue();
}

void movi_adjust_threshold()
{
  uint8_t current_MOVI_THRESHOLD = MOVI_THRESHOLD;
  uint32_t rpm = ecm.ecmValue[VALUE_RPM].decodeValue();

  if (rpm > RPM_LOW && MOVI_THRESHOLD <= DEFAULT_MOVI_THRESHOLD_LOW_RPM) {
    MOVI_THRESHOLD = DEFAULT_MOVI_THRESHOLD_HIGH_RPM;
    movi.setThreshold(MOVI_THRESHOLD);                  
  } else if (rpm > RPM_ZERO && rpm <= RPM_LOW && (MOVI_THRESHOLD <= DEFAULT_MOVI_THRESHOLD_ZERO_RPM || MOVI_THRESHOLD >= DEFAULT_MOVI_THRESHOLD_HIGH_RPM)) {
    MOVI_THRESHOLD = DEFAULT_MOVI_THRESHOLD_LOW_RPM;
    movi.setThreshold(MOVI_THRESHOLD);
  } else if (rpm == RPM_ZERO && MOVI_THRESHOLD >= DEFAULT_MOVI_THRESHOLD_LOW_RPM) {
    MOVI_THRESHOLD = DEFAULT_MOVI_THRESHOLD_ZERO_RPM;
    movi.setThreshold(MOVI_THRESHOLD);
  }

  if (MOVI_THRESHOLD != current_MOVI_THRESHOLD) {
    Serial.print(F("Adjusting MOVI threshold - RPM = "));
    Serial.print(rpm);
    Serial.print(F(" ; from "));
    Serial.print(current_MOVI_THRESHOLD);
    Serial.print(F(" to "));
    Serial.println(MOVI_THRESHOLD);
  }
  
}


#define SIGNAL_WARN_TIME 60
#define SIGNAL_ON_ANALOG 400

// Be careful with the SIGNAL_STATE enum - we're using a binary trick to get the state of none, turn, or hazard
enum SIGNAL_STATE { SIGNAL_NONE = 0, SIGNAL_RIGHT_TURN = 1, SIGNAL_LEFT_TURN = 2, SIGNAL_HAZARD = 3 };
uint8_t last_signal_state = SIGNAL_NONE;
uint32_t last_signal_millis = 0;
uint32_t start_signal_millis = 0;

long last_movi_threshold_adjust = 0;

uint8_t MOVI_threshold_up_2 = 0;
uint8_t MOVI_threshold_down_2 = 0;
uint8_t MOVI_threshold_up_1 = 0;
uint8_t MOVI_threshold_down_1 = 0;
uint8_t MOVI_threshold_up_0 = 0;
uint8_t MOVI_threshold_down_0 = 0;

void check_signals() {

// Quick and dirty trigger to increase/decrease MOVI threshold for testing
  if (ecm.ecmValue[VALUE_MPH].decodeValue() == 0) {
    uint16_t rightVoltage = ecm.sensorValue[VALUE_RIGHT_TURN].decodeValue();
    uint16_t leftVoltage = ecm.sensorValue[VALUE_LEFT_TURN].decodeValue();
    unsigned long current_millis = millis();
  
    uint8_t current_signal_state = 0;
    if (rightVoltage > SIGNAL_ON_ANALOG) current_signal_state |= SIGNAL_RIGHT_TURN;
    if (leftVoltage > SIGNAL_ON_ANALOG) current_signal_state |= SIGNAL_LEFT_TURN;

    MOVI_threshold_up_2 = MOVI_threshold_up_1;
    MOVI_threshold_down_2 = MOVI_threshold_down_1;
    MOVI_threshold_up_1 = MOVI_threshold_up_0;
    MOVI_threshold_down_1 = MOVI_threshold_down_0;
    MOVI_threshold_up_0 = current_signal_state;
    MOVI_threshold_down_0 = current_signal_state;

#ifdef SIGNAL_ADJUST_THRESHOLD
    if (MOVI_threshold_up_2 == 0 && MOVI_threshold_up_1 == SIGNAL_RIGHT_TURN && MOVI_threshold_up_0 == 0) {
      ++MOVI_THRESHOLD;
      say_number(String(MOVI_THRESHOLD));
      movi.setThreshold(MOVI_THRESHOLD);
    } else if (MOVI_threshold_down_2 == 0 && MOVI_threshold_down_1 == SIGNAL_LEFT_TURN && MOVI_threshold_down_0 == 0) {
      --MOVI_THRESHOLD;
      say_number(String(MOVI_THRESHOLD));
      movi.setThreshold(MOVI_THRESHOLD);
    } else 
#endif
    
    if (MOVI_threshold_down_2 == 0 && MOVI_threshold_down_1 == SIGNAL_HAZARD && MOVI_threshold_down_0 == 0) {
      String mic_debug_switch;
      if (MOVI_MICDEBUG == 0) {
       MOVI_MICDEBUG = 1;
       mic_debug_switch = F("ON");
       say_number(String("1"));
      } else {
        MOVI_MICDEBUG = 0;
        mic_debug_switch = F("OFF");
        say_number(String("0"));
      }
      movi.sendCommand(F("MICDEBUG"), mic_debug_switch);
      movi.sendCommand(F("RESTART"), F(""));
      
    }
  }
  

// If we're sitting at a stop light we could be signaling for a long time for a valid reason

  if (ecm.ecmValue[VALUE_MPH].decodeValue() <= 5) {
    lcd.noCursor();
    last_signal_state = SIGNAL_NONE;
    last_signal_millis = 0;
    start_signal_millis = 0;
    return;
  }

// There is a bit of a timing challenge here with the hazard lights because we can't query 
// the two signals at exactly the same time.

  uint16_t rightVoltage = ecm.sensorValue[VALUE_RIGHT_TURN].decodeValue();
  uint16_t leftVoltage = ecm.sensorValue[VALUE_LEFT_TURN].decodeValue();
  unsigned long current_millis = millis();

  uint8_t current_signal_state = 0;
  if (rightVoltage > SIGNAL_ON_ANALOG) current_signal_state |= SIGNAL_RIGHT_TURN;
  if (leftVoltage > SIGNAL_ON_ANALOG) current_signal_state |= SIGNAL_LEFT_TURN;

  if (current_signal_state == SIGNAL_NONE) {
    if (last_signal_state != SIGNAL_NONE) {
      lcd.noCursor();
      if (currentMillis - last_signal_millis > 2000) {
        last_signal_state = SIGNAL_NONE;
        start_signal_millis = 0;
        last_signal_millis = 0;
      }
      lcdCursorLocation = -1;
    }
  } else {
    switch (current_signal_state) {
      case SIGNAL_RIGHT_TURN:
        lcdCursorLocation = 15;
        break;
      case SIGNAL_LEFT_TURN:
        lcdCursorLocation = 0;
        break;
      case SIGNAL_HAZARD:
        lcdCursorLocation = 7;
        break;
    }
    if (current_signal_state != last_signal_state) {
      lcdCursorLocation = -1;
      
      lcd.setCursor(lcdCursorLocation, 0);
      lcd.cursor();
      
      start_signal_millis = current_millis;
      last_signal_millis = current_millis;
      last_signal_state = current_signal_state;
    } else {
      last_signal_millis = current_millis;

      if (last_signal_millis - start_signal_millis > SIGNAL_WARN_TIME * 1000) {
        Serial.print("Warn about signal state ");
        Serial.println(current_signal_state);

        String signalWarning = F("SIGNAL");
        signalWarning = signalWarning + current_signal_state + F(".MP3");
        say(signalWarning);

        say(number_path(SIGNAL_WARN_TIME)+ F(".MP3"));

        say(F("SECONDS.MP3"));

        start_signal_millis = current_millis;
        last_signal_millis = current_millis;
        
      }
    }
  }
  
}

#define LOW_FUEL_THRESHOLD 20
uint8_t low_fuel_count = 0;

void check_fuel()
{
  // Need to see low fuel for 10 seconds or more because fuel sloshes around and gives false positive otherwise
  
  uint32_t fuel_level = ecm.sensorValue[VALUE_FUEL_LEVEL].decodeValue();  

  if (!announced_low_fuel && ecm.ecmValue[VALUE_CLOSED_LOOP].decodeValue() && fuel_level < LOW_FUEL_THRESHOLD) {
    ++low_fuel_count;
    if (low_fuel_count >= 10) {
      say(F("FUEL0.MP3"));
      announced_low_fuel = 1;
    }
  } else {
    low_fuel_count = 0;
  }
}

//#define MP3_CALLSIGN_RESPONSE

void setup() {
  // put your setup code here, to run once:

  Serial.begin(115200);
  Serial1.begin(115200);

  Serial.println(F("RESET"));

  for (int i = 0; i < 10; ++i) {  
    lcd.begin(16,2);             // 16 characters, 2 rows
  }
  
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("ARDUINO BOOTING ");

  lcd.setCursor(0,1);
  lcd.print("Starting SDCard ");
  
  //Initialize the SdCard.
  if(!sd.begin(SD_SEL, SPI_FULL_SPEED)) sd.initErrorHalt();
  // depending upon your SdCard environment, SPI_HAVE_SPEED may work better.
  if(!sd.chdir(F("/"))) sd.errorHalt(F("sd.chdir"));

  Serial.print(F("SD fatType() = "));
  Serial.println(sd.vol()->fatType());

  lcd.setCursor(0,1);
  lcd.print("Starting MP3    ");
  
  mp3.begin();
  mp3.setVolume(0, 0);

  lcd.setCursor(0,1);
  lcd.print("Starting MOVI   ");

  movi.welcomeMessage(false);             // silence MOVI's welcome message
  movi.sendCommand(F("SYSTEMMESSAGES"), F("OFF"));


  movi.init();

  lcd.setCursor(0,1);
  lcd.print("Starting MOVI2  ");

  strcpy_P(MOVI_last_words_trained, (char*)pgm_read_word(&(MOVI_sentence_table[0])));
  movi.callSign(MOVI_last_words_trained);

  int i = 0;
  while(strlen_P((char *)pgm_read_word(&MOVI_sentence_table[i])) > 0) {
    strcpy_P(MOVI_last_words_trained, (char *)pgm_read_word(&MOVI_sentence_table[i]));
    
    movi.addSentence(MOVI_last_words_trained);
    ++i;
  }

  movi.train();

  movi.responses(false);                  // silence MOVI's responses
#ifdef MP3_CALLSIGN_RESPONSE
  movi.beeps(false);                      // silence MOVI's beeps -- we recommend to do that once you are familiar with this example.
#endif
  movi.setThreshold(MOVI_THRESHOLD);    // uncomment and set to a higher value (valid range 2-95) if you have a problems due to a noisy environment.


  // Using A8 to trigger logic analyzer
  pinMode2(A8, OUTPUT);
  digitalWrite2(A8, LOW);

  randomSeed(analogRead(0));  

}

void loop() {
  // put your main code here, to run repeatedly:

  while(1) {
    currentMillis = millis();

    #ifdef DISCONNECTED_MODE
      if (currentMillis > 20000) ecm.SRAM[RAM_OFFSET_CLCC] = ecm.SRAM[RAM_OFFSET_CLCC] | 0x80;
/*      if (currentMillis % 1000 == 0) {
        Serial.println(F("Flipping WOT"));
        ecm.SRAM[RAM_OFFSET_CLCC] = ecm.SRAM[RAM_OFFSET_CLCC] ^ 0x08; 
      } */
    #endif

    int movi_res = 0;

    if (song_playing && !mp3.isPlaying()) {
      // Reset volume if a song was playing but it ended
      song_playing = 0;
      mp3.setVolume(0, 0);
    }

    if (vr_mode == VR_MODE_SPEAKING_TRIGGER) {
      // wait out the trigger response or we pick up trigger response voice and fail command recognition
      if (!mp3.isPlaying()) {
//          mp3.setVolume(0, 0);
//          movi.setThreshold(MOVI_THRESHOLD);
#ifdef MP3_CALLSIGN_RESPONSE
          while ((movi_res = movi.poll()) != 0 ) {
            Serial.print(F("Flushing after callsign response - movi.poll() = "));
            Serial.println(movi_res);
            delay(5);
          }
          movi.ask();
#endif          
          vr_mode = VR_MODE_AWAITING_COMMAND;
          MOVI_callsign_millis = currentMillis;
      }
/*      
    // This timeout routine is meant to ensure that the voice recognition doesn't wait too long between
    // callsign and sentence recognition, but it doesn't work well with MOVI because MOVI samples for
    // an uncertain amount of time during sentence recognition, and tends to take longer in a noisy
    // environment.
    } else if (vr_mode == VR_MODE_AWAITING_COMMAND && currentMillis - MOVI_callsign_millis > 6000) {

      MOVI_reset();
      vr_mode = VR_MODE_AWAITING_TRIGGER;
      MOVI_callsign_millis = 0;
*/      
    } else if ((movi_res = movi.poll()) != 0 ) {

      Serial.print(F("movi.poll() = "));
      Serial.println(movi_res);

      if (movi_res == CALLSIGN_DETECTED) {
//        movi.setThreshold(95);
//        movi.pause();
#ifdef MP3_CALLSIGN_RESPONSE
        while (movi.poll() != BEGIN_LISTEN ) delay(5);
        Serial.println(F("movi_poll() got BEGIN_LISTEN, calling finish()"));
        movi.finish();
        while (movi.poll() != END_LISTEN) delay(5);
        Serial.println(F("movi_poll() got END_LISTEN"));
#endif
        mp3.stopTrack();
        mp3.setVolume(0, 0);
#ifdef MP3_CALLSIGN_RESPONSE
        mp3.playMP3("TRIGGER.BAK");
#endif
        vr_mode = VR_MODE_SPEAKING_TRIGGER;
      } else if (movi_res == RAW_WORDS) {
        MOVI_last_words = movi.getResult();
      } else if (movi_res > 1) {
        strcpy_P(MOVI_last_words_trained, (char *)pgm_read_word(&MOVI_sentence_table[movi_res-1]));
        Serial.print(F("Heard: "));
        Serial.print(MOVI_last_words);
        Serial.print(F(", MOVI selected trained sentence: "));
        Serial.println(MOVI_last_words_trained);
        if (MOVI_last_words.indexOf(MOVI_last_words_trained) >= 0) {
          uint8_t vr_command = movi_res - 2;
          Serial.print(F("Got VR command "));
          Serial.println(vr_command);

          Serial.println(vr_action[vr_command].lcd_page);
          Serial.println(vr_action[vr_command].intro_MP3);
          Serial.println(vr_action[vr_command].ecm_value);
          Serial.println(vr_action[vr_command].suffix_MP3);
          Serial.println(vr_action[vr_command].special_case);

          if (vr_action[vr_command].lcd_page > -2) {
            display_lock = vr_action[vr_command].lcd_page;
            if (display_lock >= 0) {
              display_current = display_lock;
              update_lcd();
            }
          }

          if (vr_action[vr_command].special_case != VR_SPECIAL_CASE_MALF) {
            say(vr_action[vr_command].intro_MP3);
            if (vr_action[vr_command].ecm_value >= 0 || vr_action[vr_command].special_case == VR_SPECIAL_CASE_ERRORS) {
              String valueString;
              if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_ERRORS) valueString = String(checksum_errors);
              else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_SENSOR) valueString = ecm.sensorValue[vr_action[vr_command].ecm_value].getValueString();
              else valueString = ecm.ecmValue[vr_action[vr_command].ecm_value].getValueString();
              say_number(valueString);
            }
            if (strlen(vr_action[vr_command].suffix_MP3) > 0) {
              say(vr_action[vr_command].suffix_MP3);
            }

            if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_CANCEL) {
              if (mp3.isPlaying()) mp3.stopTrack();
              announce_closed_loop = 0;
              announce_wot = 0;
              lcd.begin(16,2);
              lcd.clear();

            } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_TPS) {
                say(F("TPS3.MP3"));
                announce_wot = 1;              
            } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_LOOP_STATUS
               && !(ecm.ecmValue[VALUE_CLOSED_LOOP].decodeValue())) {
                say(F("LOOP3.MP3"));
                announce_closed_loop = 1;
            } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_FAVOURITE_SONG) {
              mp3.setVolume(MP3_SONG_VOLUME, MP3_SONG_VOLUME);
              song_playing = 1;
              mp3.playMP3("SONGS/TRACK001.MP3");
            } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_RANDOM_SONG) {
              long randNumber = random(2, 41);
              String tmpString = String(F("SONGS/TRACK0"));
              if (randNumber < 10) tmpString = tmpString + F("0");
              tmpString = tmpString + randNumber + F(".MP3");
              Serial.println(tmpString);
              char tmpstr[32];
              strcpy(tmpstr, tmpString.c_str());
              mp3.setVolume(MP3_SONG_VOLUME, MP3_SONG_VOLUME);
              song_playing = 1;
              mp3.playMP3(tmpstr);
            }
            
            Serial.println(F("done saying non-special case"));                   

//while (Serial1.available()) Serial1.read();
          
          } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_MALF) {
            sayMALF(VALUE_MALF);
            
          }
  
          vr_mode = VR_MODE_AWAITING_TRIGGER;
        
        } else {
          Serial.println(F("VR unrecognized command"));
          vr_mode = VR_MODE_AWAITING_TRIGGER;
        }
        
      }
    }
    
    if (currentMillis - last_refresh_millis > REFRESH_FREQ_MILLIS) {

      uint8_t refreshSuccess = refresh_SRAM();
    
      if (refreshSuccess == 0) {
        // Successful refresh

        // Announce closed loop if requested

        if (announce_closed_loop && (!announced_closed_loop)) {
          if (ecm.ecmValue[VALUE_CLOSED_LOOP].decodeValue()) {

            Serial.println(F("Announcing switch to closed loop"));

            say(vr_action[VR_COMMAND_LOOP_STATUS].intro_MP3);
            String valueString = ecm.ecmValue[vr_action[VR_COMMAND_LOOP_STATUS].ecm_value].getValueString();
            valueString.trim();
            say(valueString + F(".MP3"));
            say(vr_action[VR_COMMAND_LOOP_STATUS].suffix_MP3);
                     
            announced_closed_loop = 1;
          }

        }

        // Check new MALF's

        if (announced_MALF != ecm.ecmValue[VALUE_MALF].decodeValue()) {

          // Wait until closed loop to announce MALFs, otherwise we're just getting started, engine roaring at fast idle...

          if (ecm.ecmValue[VALUE_CLOSED_LOOP].decodeValue() && ecm.ecmValue[VALUE_SES_LIGHT].decodeValue()) {
            // Need to turn off vr or system has high chance of detecting trigger from MALF speech.
            sayMALF(VALUE_MALF);
          }
          
        } 
        
        if (announce_wot) { 
          if (ecm.ecmValue[VALUE_WOT].decodeValue()) {
            if (!announced_wot && last_announced_wot - currentMillis > 5000) {
              say(F("WOT.MP3"));
             
              last_announced_wot = currentMillis;
              announced_wot = 1;
            }
          } else {
            announced_wot = 0;
          }
         
        } /* WOT */

        double run_time = ecm.ecmValue[VALUE_ENGINE_RUN_TIME].decodeValueWithFraction();
        if (run_time < last_run_time && ecm.ecmValue[VALUE_RPM].decodeValue() > 0) {
          say(F("ECMRESET.MP3"));
          say_number(String(last_run_time));
          say(F("RUNTIME2.MP3"));
        }
        last_run_time = run_time;
        
      } /* Successful SRAM refresh */
      
    } /*  (currentMillis - last_refresh_millis > REFRESH_FREQ_MILLIS) */ 
/*
    if (currentMillis - last_movi_threshold_adjust) {

      last_movi_threshold_adjust = currentMillis;
      movi_adjust_threshold();
      
    }
*/

    if (currentMillis - last_cycle_display_millis > CYCLE_DISPLAY_MILLIS) {

      last_cycle_display_millis = currentMillis;
      last_update_display_millis = currentMillis;

      if (display_lock < 0) ++display_current;
      if (display_current > MAX_GMECM_LCD_PAGE) display_current = 0;
  
      update_lcd();

    } else if (currentMillis - last_update_display_millis > UPDATE_DISPLAY_MILLIS  && display_current >= 0) {

      last_update_display_millis = currentMillis;
      update_lcd_values();
      
    }

    if (currentMillis - last_check_signal_millis > CHECK_SIGNAL_MILLIS) {
      check_signals();
      last_check_signal_millis = currentMillis;
    }

    if (currentMillis - last_check_fluids_millis > CHECK_FLUIDS_MILLIS) {
      check_fuel();
      last_check_fluids_millis = currentMillis;
    }
    
    if (movi_res == 0) delay(100);

  }
}

