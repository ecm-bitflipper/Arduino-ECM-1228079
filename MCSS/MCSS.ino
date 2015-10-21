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


#include <EasyVR.h>

#include <LiquidCrystal595.h>
#include "Format16x2String.h";

#include "GMECM1228079.h"

#include "sample_data.h"

LiquidCrystal595 lcd(46,47,48);     // datapin, latchpin, clockpin

EasyVR easyvr(Serial1);

SdFat sd;
SFEMP3Shield mp3;

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

#define VR_USE_SI 1

enum VR_MODE { VR_MODE_AWAITING_TRIGGER, VR_MODE_SPEAKING_TRIGGER, VR_MODE_AWAITING_COMMAND };

uint8_t vr_mode = VR_MODE_AWAITING_TRIGGER;

struct VR_ACTION {
   int8_t lcd_page;
   char intro_MP3[13];
   int8_t ecm_value;
   char suffix_MP3[13];
   int8_t special_case;
};

enum VR_SPECIAL_CASE { VR_SPECIAL_CASE_TPS = 1, VR_SPECIAL_CASE_LOOP_STATUS = 2, VR_SPECIAL_CASE_MALF = 3, VR_SPECIAL_CASE_ERRORS = 4,
                       VR_SPECIAL_CASE_FAVOURITE_SONG = 5, VR_SPECIAL_CASE_CANCEL = 6, VR_SPECIAL_CASE_RANDOM_SONG = 7 };

#define MAX_VR_COMMAND 20

const VR_ACTION vr_action[MAX_VR_COMMAND] = 
                                  { { /* 0 = SPEED */ LCD_PAGE_SPEED, "SPEED1.MP3", VALUE_MPH, "SPEED2.MP3", 0 },
                                  { /* 1 = RPM */ LCD_PAGE_SPEED, "RPM1.MP3", VALUE_RPM, "RPM2.MP3", 0 },
                                  { /* 2 = THROTTLE */ LCD_PAGE_THROTTLE, "TPS1.MP3", VALUE_TPS, "TPS2.MP3", VR_SPECIAL_CASE_TPS },
                                  { /* 3 = LOOP_STATUS */ LCD_PAGE_LOOP_STATUS, "LOOP1.MP3", VALUE_CLOSED_LOOP, "LOOP2.MP3", VR_SPECIAL_CASE_LOOP_STATUS},
                                  { /* 4 = RUNTIME */ LCD_PAGE_RUN_TIME, "RUNTIME1.MP3", VALUE_ENGINE_RUN_TIME, "RUNTIME2.MP3", 0},
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
                                  { /*17 = FAVOURITE_SONG - not yet implemented */ -1, "", -1, "", VR_SPECIAL_CASE_FAVOURITE_SONG },
                                  { /*18 = RANDOM_SONG - not yet implemented */ -1, "", -1, "", VR_SPECIAL_CASE_RANDOM_SONG },
                                  { /*19 = CANCEL - not yet implemented */ -1, "ACK.MP3", -1, "", VR_SPECIAL_CASE_CANCEL } };

uint8_t responding_to_command = -1;
uint8_t responding_to_command_step = -1;
uint8_t announce_wot = 0;
uint8_t announced_wot = 0;
unsigned long last_announced_wot = 0;
uint8_t announce_closed_loop = 0;
uint8_t announced_closed_loop = 0;

uint32_t announced_MALF = 0;

void update_lcd_values() {

Serial.print("About to update LCD values for page ");
Serial.println(display_current);
  
  if (display_current == MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,1);
    lcd.print(Format16x2String(String(checksum_errors) + '/' + String(refresh_errors), String(ecm.lastRefreshCount)));
Serial.println(Format16x2String(String(checksum_errors) + '/' + String(refresh_errors), String(ecm.lastRefreshCount)));    
  } else if (display_current < MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,1);
    lcd.print(ecm.lcdPage[display_current].getValueString());
Serial.println(ecm.lcdPage[display_current].getValueString());      
  }

Serial.println("Done updating LCD values");

}

void update_lcd() {

  if (display_current == MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,0);
    lcd.print(Format16x2String(F("ERRORS"), F("RESPONSE")));
Serial.println(Format16x2String(F("ERRORS"), F("RESPONSE")));
  } else if (display_current < MAX_GMECM_LCD_PAGE) {
    lcd.setCursor(0,0);
    lcd.print(ecm.lcdPage[display_current].getTitleBar());
Serial.println(ecm.lcdPage[display_current].getTitleBar());
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
      ++refresh_errors;
      
      Serial.println(F("Error - Refresh count!"));
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
  if (mp3.isPlaying()) mp3.stopTrack();
  
  /* Need to compensate for the MP3 library's lack of the use of "const". */
  /* They don't actually modify the string, but we can't just call playMP3 without the clumsy cast */
  mp3.playMP3((char *)(s.c_str()));
  while (mp3.isPlaying()) update_lcd_while_talking();
}

void sayMALF(int vr_command) {
  Serial.println(F("begin MALF"));
  Serial.print(F("getValueString() = "));
  Serial.println(ecm.ecmValue[vr_action[vr_command].ecm_value].getValueString());

  String valueString(ecm.ecmValue[vr_action[vr_command].ecm_value].getValueString());
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
  announced_MALF = ecm.ecmValue[VALUE_MALF].decodeValue();
}

void setup() {
  // put your setup code here, to run once:

  Serial.begin(115200);
  Serial1.begin(9600);

  Serial.println(F("RESET"));

  for (int i = 0; i < 10; ++i) {  
    lcd.begin(16,2);             // 16 characters, 2 rows
  }
  
  lcd.clear();
  lcd.setCursor(0,0);

  // initialize EasyVR  
  if (!easyvr.detect())
  {
    Serial.println(F("EasyVR not detected!"));
    delay(1000);
  }

  easyvr.setPinOutput(EasyVR::IO1, LOW);
  Serial.print(F("EasyVR detected, version "));
  Serial.println(easyvr.getID());
  easyvr.setTimeout(0);
  easyvr.setLanguage(EasyVR::ENGLISH);
  easyvr.setKnob(EasyVR::STRICTER);
  easyvr.setLevel(EasyVR::EASY);
//  easyvr.setMicDistance(EasyVR::ARMS_LENGTH);
  easyvr.setMicDistance(EasyVR::HEADSET);


  if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);
  else easyvr.recognizeCommand(VR_GROUP_TRIGGER);
  
  //Initialize the SdCard.
  if(!sd.begin(SD_SEL, SPI_FULL_SPEED)) sd.initErrorHalt();
  // depending upon your SdCard environment, SPI_HAVE_SPEED may work better.
  if(!sd.chdir(F("/"))) sd.errorHalt(F("sd.chdir"));

  Serial.print(F("SD fatType() = "));
  Serial.println(sd.vol()->fatType());

  
  mp3.begin();
  mp3.setVolume(0, 0);

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


    if (vr_mode == VR_MODE_SPEAKING_TRIGGER) {
      // wait out the trigger response or we pick up trigger response voice and fail command recognition
      if (!mp3.isPlaying()) {
          vr_mode = VR_MODE_AWAITING_COMMAND;
          easyvr.setTimeout(5);

          if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_COMMAND);
          else easyvr.recognizeCommand(VR_GROUP_COMMAND);
          
      }
    } else if (easyvr.hasFinished()) {
      if (easyvr.isTimeout()) {
        Serial.println(F("Easy VR Timed out"));
        
        vr_mode = VR_MODE_AWAITING_TRIGGER;
        easyvr.setTimeout(0);
        
        if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);
        else easyvr.recognizeCommand(VR_GROUP_TRIGGER);
        
      } else if (vr_mode == VR_MODE_AWAITING_TRIGGER) {
        int8_t r;

        if (VR_USE_SI) r = easyvr.getWord();
        else r = easyvr.getCommand();
        
        if (r == 0) {
          Serial.print(F("VR got trigger - getError = "));
          Serial.println(easyvr.getError());
          if (mp3.isPlaying()) mp3.stopTrack();
          mp3.playMP3("TRIGGER.MP3");
          vr_mode = VR_MODE_SPEAKING_TRIGGER;

        } else {
            Serial.print(F("VR Error - didn't get a valid trigger word - getError() = "));
            Serial.println(easyvr.getError(), HEX);
            vr_mode = VR_MODE_AWAITING_TRIGGER;          
            easyvr.setTimeout(0);
            
            if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);    
            else easyvr.recognizeCommand(VR_GROUP_TRIGGER);    

        }
      } else {
        int8_t vr_command;
        
        if (VR_USE_SI) vr_command = easyvr.getWord();
        else vr_command = easyvr.getCommand();

        if (vr_command == -1 && mp3.isPlaying()) {
          // Heard self talking, try again
          Serial.println(F("Heard self talking, trying again"));
          easyvr.setTimeout(5);
          
          if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_COMMAND);
          else easyvr.recognizeCommand(VR_GROUP_COMMAND);
          
        } else if (vr_command >= 0 && vr_command < MAX_VR_COMMAND) {

          /* All kinds of processing here */

          
  
          Serial.print(F("Got VR command "));
          Serial.print(vr_command);
          Serial.print(F(" with getError() = "));
          Serial.println(easyvr.getError());

          Serial.println(vr_action[vr_command].lcd_page);
          Serial.println(vr_action[vr_command].intro_MP3);
          Serial.println(vr_action[vr_command].ecm_value);
          Serial.println(vr_action[vr_command].suffix_MP3);
          Serial.println(vr_action[vr_command].special_case);

          display_lock = vr_action[vr_command].lcd_page;
          if (display_lock >= 0) {
            display_current = display_lock;
            update_lcd();
          }

          if (vr_action[vr_command].special_case != VR_SPECIAL_CASE_MALF) {
            say(vr_action[vr_command].intro_MP3);
            if (vr_action[vr_command].ecm_value >= 0 || vr_action[vr_command].special_case == VR_SPECIAL_CASE_ERRORS) {
              String valueString;
              if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_ERRORS) valueString = String(checksum_errors);
              else valueString = ecm.ecmValue[vr_action[vr_command].ecm_value].getValueString();
              valueString.trim();
              String tmpString = valueString;
              if (isdigit(tmpString[0])) {
                tmpString = number_path(tmpString.toInt()) + F(".MP3");
                say(tmpString);
                
                long point = valueString.indexOf('.');
                if (point >= 0) {
                  say(F("POINT.MP3"));
                  tmpString = number_path(valueString.substring(point+1).toInt()) + F(".MP3");
                  say(tmpString);
                }
              
              } else {
                say(tmpString + F(".MP3"));
              }
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
              mp3.playMP3("SONGS/TRACK001.MP3");
            } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_RANDOM_SONG) {
              long randNumber = random(2, 41);
              String tmpString = String(F("SONGS/TRACK0"));
              if (randNumber < 10) tmpString = tmpString + F("0");
              tmpString = tmpString + randNumber + F(".MP3");
              Serial.println(tmpString);
              char tmpstr[32];
              strcpy(tmpstr, tmpString.c_str());
              mp3.playMP3(tmpstr);
            }
            
            Serial.println(F("done saying non-special case"));                   
          } else if (vr_action[vr_command].special_case == VR_SPECIAL_CASE_MALF) {
            sayMALF(vr_command);
            
          }
  
          vr_mode = VR_MODE_AWAITING_TRIGGER;
          easyvr.setTimeout(0);                 

          if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);
          else easyvr.recognizeCommand(VR_GROUP_TRIGGER);               

        
        } else {
          Serial.print(F("VR unrecognized command, getError() = "));
          Serial.println(easyvr.getError());
          vr_mode = VR_MODE_AWAITING_TRIGGER;
          easyvr.setTimeout(0);

          if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);            
          else easyvr.recognizeCommand(VR_GROUP_TRIGGER);

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

            easyvr.stop();            
            say(vr_action[VR_COMMAND_LOOP_STATUS].intro_MP3);
            String valueString = ecm.ecmValue[vr_action[VR_COMMAND_LOOP_STATUS].ecm_value].getValueString();
            valueString.trim();
            say(valueString + F(".MP3"));
            say(vr_action[VR_COMMAND_LOOP_STATUS].suffix_MP3);
            if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);            
            else easyvr.recognizeCommand(VR_GROUP_TRIGGER);
                     
            announced_closed_loop = 1;
          }

        }

        // Check new MALF's

        if (announced_MALF != ecm.ecmValue[VALUE_MALF].decodeValue()) {

          // Wait until closed loop to announce MALFs, otherwise we're just getting started, engine roaring at fast idle...

          if (ecm.ecmValue[VALUE_CLOSED_LOOP].decodeValue()) {
            // Need to turn off vr or system has high chance of detecting trigger from MALF speech.
            easyvr.stop();
            sayMALF(VR_COMMAND_TROUBLE_CODES);
            if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);            
            else easyvr.recognizeCommand(VR_GROUP_TRIGGER);
          }
          
        } 
        
        if (announce_wot) { 
          if (ecm.ecmValue[VALUE_WOT].decodeValue()) {
            if (!announced_wot && last_announced_wot - currentMillis > 5000) {
              easyvr.stop();              
              say(F("WOT.MP3"));
              if (VR_USE_SI) easyvr.recognizeWord(VR_WORDSET_TRIGGER);            
              else easyvr.recognizeCommand(VR_GROUP_TRIGGER);
             
              last_announced_wot = currentMillis;
              announced_wot = 1;
            }
          } else {
            announced_wot = 0;
          }
         
        } /* WOT */
      } /* Successful SRAM refresh */
    } /*  (currentMillis - last_refresh_millis > REFRESH_FREQ_MILLIS) */ 

    if (currentMillis - last_cycle_display_millis > CYCLE_DISPLAY_MILLIS) {

      last_cycle_display_millis = currentMillis;
      last_update_display_millis = currentMillis;

      if (display_lock < 0) ++display_current;
      if (display_current > MAX_GMECM_LCD_PAGE) display_current = 0;
  
      update_lcd();

      ecm.dumpToSerial();

    } else if (currentMillis - last_update_display_millis > UPDATE_DISPLAY_MILLIS  && display_current >= 0) {

      last_update_display_millis = currentMillis;
      update_lcd_values();
      
    }
    
    delay(5);

  }
}

