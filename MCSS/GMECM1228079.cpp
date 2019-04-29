#include "arduino2.h"
#include <stdint.h>

#include "DualChannelSRAM.h"

#include "GMECM1228079.h"

#include "Format16x2String.h";




#ifdef DISCONNECTED_MODE
#include "sample_data.h"
#endif

#define INTERRUPT 40

const uint8_t GMECM::MALFMap[32] = {
  24, 34, 0, 21, 15, 14, 13, 12,
  42, 41, 35, 34, 0, 32, 0, 0,
  55, 54, 53, 0, 51, 45, 44, 43,
  0, 0, 0, 0, 0, 0, 0, 0
};

void GMECMValue::setup(GMECM *pecm,
                               const String& ptitle, uint16_t poffset, double pfactor) {
  ecm = pecm;

  title = ptitle;
  offset = poffset;
  offsetMSB = 0;
  offsetMALF = 0;
  factor = pfactor;
  mask = 0xFF;
}

void GMECMValue::setup(GMECM *pecm,
                               const String& ptitle, uint16_t poffset, uint8_t pmask, const String &pBooleanTrue, const String &pBooleanFalse) {
  ecm = pecm;

  title = ptitle;
  offset = poffset;
  offsetMSB = 0;
  offsetMALF = 0;
  factor = 1.0;
  mask = pmask;
  booleanTrue = pBooleanTrue;
  booleanFalse = pBooleanFalse;
}

void GMECMValue::setup(GMECM *pecm,
                               const String& ptitle, uint16_t poffset, String pSpecialTable) {
  ecm = pecm;

  title = ptitle;
  offset = poffset;
  offsetMSB = 0;
  offsetMALF = 0;
  factor = 1.0;
  mask = 0xFF;
  specialTable = pSpecialTable;
}

void GMECMValue::setup(GMECM *pecm,
                       const String& ptitle, uint16_t poffsetMSB, uint16_t poffsetLSB, double pfactor) {
  ecm = pecm;

  title = ptitle;
  offset = poffsetLSB;
  offsetMSB = poffsetMSB;
  offsetMALF = 0;  
  factor = pfactor;
  mask = 0xFF;                        
}

void GMECMValue::setup(GMECM *pecm, const String& ptitle, uint16_t poffsetMALF1, uint16_t poffsetMALF2, uint16_t poffsetMALF3) {
  ecm = pecm;

  title = ptitle;
  offset = poffsetMALF1;
  offsetMSB = poffsetMALF2;
  offsetMALF = poffsetMALF3;
  factor = 1.0;
  mask = 0xFF;    
}

void GMECMLCDPage::setup(GMECM *pecm,
                         VehicleValue *value1,
                         VehicleValue *value2 ) {
  ecm = pecm;

  column = new VehicleValue *[2];

  column[0] = value1;
  column[1] = value2;
}


String GMECMValue::getTitleBar() {
  return Format16x2String(title);
}

String GMECMLCDPage::getTitleBar() {
  if (column[1] != 0) return column[0]->getTitleBar() + column[1]->getTitleBar();
  else return column[0]->getTitleBar() + F("        ");
}

const uint8_t PROGMEM GMECMValue::coolant_encode[] = { 0, 57, 63, 70, 78, 86, 95, 115, 136, 158, 179, 198, 215, 228, 237, 244, 249, 252, 255 };
const int8_t PROGMEM GMECMValue::coolant_decode[] = { 120, 120, 115, 110, 105, 100, 95, 85, 75, 65, 55, 45, 35, 25, 15, 5, -5, -15, -15};

uint32_t GMECMValue::decodeValue() {
  if (specialTable == "COOLANT_TEMP") {

    int i = 0;
    while (pgm_read_byte(&coolant_encode[i]) < ecm->SRAM[offset] && pgm_read_byte(&coolant_encode[i]) < 255) ++i;
    
    if (pgm_read_byte(&coolant_encode[i]) == ecm->SRAM[offset]) return pgm_read_byte(&coolant_decode[i]);
    else if (i == 0) return pgm_read_byte(&coolant_decode[0]);

    double percent_between_encode = double(ecm->SRAM[offset] - pgm_read_byte(&coolant_encode[i-1])) / double(pgm_read_byte(&coolant_encode[i]) - pgm_read_byte(&coolant_encode[i-1]));
    return pgm_read_byte(&coolant_decode[i-1]) + (((double)pgm_read_byte(&coolant_decode[i]) - (double)pgm_read_byte(&coolant_decode[i-1])) * percent_between_encode);
  } else if (mask != 0xFF) {
   
    if ((ecm->SRAM[offset] & mask) != 0) return 1;
    else return 0;
    
  } else if (offsetMALF > 0) {

    return (uint32_t(ecm->SRAM[offsetMALF]) << 16) + (uint32_t(ecm->SRAM[offsetMSB]) << 8) + uint32_t(ecm->SRAM[offset]);

  } else if (offsetMSB > 0) {

    return ((uint32_t(ecm->SRAM[offsetMSB]) << 8) + ecm->SRAM[offset]) * factor;
  
  } else return ecm->SRAM[offset] * factor;
}

double GMECMValue::decodeValueWithFraction() {
    
  if (offsetMSB > 0) {

    return ((uint32_t(ecm->SRAM[offsetMSB]) << 8) + ecm->SRAM[offset]) * factor;
  
  } else return ecm->SRAM[offset] * factor;

}

String GMECMValue::getValueString() {

  if (mask != 0xFF) {
    uint32_t f1 = decodeValue();
    
    if (f1 == 0) return Format16x2String(booleanFalse);
    else return Format16x2String(booleanTrue);
  } else if (offsetMALF > 0) {
    uint32_t f1 = decodeValue();
    
    String malfString;
    for (int i = 0; i < 24; ++i) {
      if (f1 & 1) {
        if (malfString.length() > 0) malfString += ',';
        malfString = malfString + GMECM::MALFMap[i];
      }
      f1 = f1 >> 1;
    }
    if (malfString.length() > 0) return malfString + F("                ");
    else return(F("NONE            "));
  } else if (abs(factor - trunc(factor) > .001)) {
    double f1 = decodeValueWithFraction();
    return Format16x2String(f1);
  } else {
    uint32_t f1 = decodeValue();
    return Format16x2String(f1);
  }
 
}


void SensorValue::setup(GMECM *pecm, const String& ptitle, uint8_t panalogPin, double pmultiplier, uint8_t pacceleratedDecay) {

  ecm = pecm;
  title = ptitle;
  analogPin = panalogPin;
  multiplier = pmultiplier;
  acceleratedDecay = pacceleratedDecay;
}

uint32_t SensorValue::decodeValue() {

// Doing multiple reads in order to try to stabilize analog readings when using more than 1 analog pin.
// http://forums.adafruit.com/viewtopic.php?f=25&t=11597

  analogRead(analogPin);
  delay(10);
  if (acceleratedDecay) {
    double factor = 100.0 / multiplier;
    int reading = analogRead(analogPin);
    return reading / (factor + abs(factor - reading)) * 100;
  }
  else return analogRead(analogPin) * multiplier;
  
}

double SensorValue::decodeValueWithFraction() {

  analogRead(analogPin);
  delay(10);
  return analogRead(analogPin) * multiplier;
  
}

String SensorValue::getTitleBar() {

  return Format16x2String(title);
  
}

String SensorValue::getValueString() {
  
  return Format16x2String(decodeValue());
  
}


String GMECMLCDPage::getValueString() {
  if (column[1] != 0) return column[0]->getValueString() + column[1]->getValueString();
  else return column[0]->getValueString() + F("        ");
}

GMECM::GMECM() : lastRefreshCount(0)
{

  ecmValue[VALUE_MPH].setup(this, F("MPH"), RAM_OFFSET_VEHICLE_SPEED, 1.0);
  ecmValue[VALUE_RPM].setup(this, F("RPM"), RAM_OFFSET_ENGINE_RPM, 25.0);

  ecmValue[VALUE_TPS].setup(this, F("TPS"), RAM_OFFSET_TPS, 0.019600);
  ecmValue[VALUE_WOT].setup(this, F("WOT"), RAM_OFFSET_CLCC, 0x08, F("YES"), F("NO"));

  ecmValue[VALUE_CLOSED_LOOP].setup(this, F("LOOP"), RAM_OFFSET_CLCC, 0x80, F("CLOSED"), F("OPEN"));
  ecmValue[VALUE_ENGINE_RUN_TIME].setup(this, F("RUNTIME"), (uint16_t)RAM_OFFSET_ENGINE_RUN_TIME_MSB, (uint16_t)RAM_OFFSET_ENGINE_RUN_TIME_LSB, 0.0166666666666667);

  ecmValue[VALUE_O2].setup(this, F("O2"), RAM_OFFSET_O2, 4.44);
  ecmValue[VALUE_RICH_LEAN].setup(this, F("RCH/LN"), RAM_OFFSET_CLCC, 0x20, F("RICH"), ("LEAN"));
  
  ecmValue[VALUE_MAP].setup(this, F("MAP"), RAM_OFFSET_MAP, 0.019600);
  ecmValue[VALUE_BARO].setup(this, F("BARO"), RAM_OFFSET_BARO, 0.019600);

  ecmValue[VALUE_COOL_TEMP].setup(this, F("COOL.\337C"), RAM_OFFSET_COOLANT_TEMP, F("COOLANT_TEMP"));
  ecmValue[VALUE_BATT_V].setup(this,  F("BATT V"), RAM_OFFSET_BATT_VOLT, 0.1);

//  ecmValue[VALUE_MCS_DUTY].setup(this, F("MCSDUTY"), RAM_OFFSET_MC_DUTY_CYCLE, 0.392157); // This is %, not degrees
  ecmValue[VALUE_MCS_DUTY].setup(this, F("MCS DC\337"), RAM_OFFSET_MC_DUTY_CYCLE, 0.234375);
  ecmValue[VALUE_EGR_DUTY].setup(this, F("EGR DC%"), RAM_OFFSET_EGR_DUTY_CYCLE, 0.392157);

  ecmValue[VALUE_CALC_SA].setup(this, F("CALC SA"), RAM_OFFSET_CALC_SA, 0.351560);
  ecmValue[VALUE_FINAL_SA].setup(this, F("FINAL SA"), RAM_OFFSET_FINAL_SA, 0.351560);
  
  ecmValue[VALUE_KNOCK].setup(this, F("KNOCKS"), RAM_OFFSET_KNOCK_COUNT, 1.0);
  ecmValue[VALUE_KNOCK_RETARD].setup(this, F("RETARD"), RAM_OFFSET_KNOCK_RETARD, 0.351560);

  ecmValue[VALUE_MALF].setup(this, F("TROUBLE CODES"), (uint16_t)RAM_OFFSET_MALF_1, (uint16_t)RAM_OFFSET_MALF_2, (uint16_t)RAM_OFFSET_MALF_3);
  ecmValue[VALUE_SES_LIGHT].setup(this, F("SESLIGHT"), RAM_OFFSET_SES_LIGHT, 0x80, F("ON"), F("OFF"));

  sensorValue[VALUE_RIGHT_TURN].setup(this, F("RIGHT"), ANALOG_PIN_RIGHT_TURN, 1.0, 0);
  sensorValue[VALUE_LEFT_TURN].setup(this, F("LEFT"), ANALOG_PIN_LEFT_TURN, 1.0, 0);
  sensorValue[VALUE_FUEL_LEVEL].setup(this, F("FUEL"), ANALOG_PIN_FUEL_LEVEL, 0.2326, 1);
  sensorValue[VALUE_OIL_PRESSURE].setup(this, F("OILPRESS"), ANALOG_PIN_OIL_PRESSURE, 0.6844, 0);

  lcdPage[LCD_PAGE_SPEED].setup(this, &ecmValue[VALUE_MPH], &ecmValue[VALUE_RPM]);
  lcdPage[LCD_PAGE_THROTTLE].setup(this, &ecmValue[VALUE_TPS], &ecmValue[VALUE_WOT]);
  lcdPage[LCD_PAGE_LOOP_STATUS].setup(this, &ecmValue[VALUE_CLOSED_LOOP], &ecmValue[VALUE_ENGINE_RUN_TIME]);
  lcdPage[LCD_PAGE_MIX].setup(this, &ecmValue[VALUE_O2], &ecmValue[VALUE_RICH_LEAN]);
  lcdPage[LCD_PAGE_PRESSURE].setup(this, &ecmValue[VALUE_MAP], &ecmValue[VALUE_BARO]);
  lcdPage[LCD_PAGE_COOL_BATT].setup(this, &ecmValue[VALUE_COOL_TEMP], &ecmValue[VALUE_BATT_V]);
  lcdPage[LCD_PAGE_DUTY_CYCLE].setup(this, &ecmValue[VALUE_MCS_DUTY], &ecmValue[VALUE_EGR_DUTY]);
  lcdPage[LCD_PAGE_SA].setup(this, &ecmValue[VALUE_CALC_SA], &ecmValue[VALUE_FINAL_SA]);
  lcdPage[LCD_PAGE_KNOCK].setup(this, &ecmValue[VALUE_KNOCK], &ecmValue[VALUE_KNOCK_RETARD]);
  lcdPage[LCD_PAGE_MALF].setup(this, &ecmValue[VALUE_MALF]);
  lcdPage[LCD_PAGE_FLUIDS].setup(this, &sensorValue[VALUE_FUEL_LEVEL], &sensorValue[VALUE_OIL_PRESSURE]);
    
  DualChannelSRAM::erase();

  #ifdef DISCONNECTED_MODE

    SRAM[RAM_OFFSET_REFRESH_COUNT_MSB] = 0xFE;
    SRAM[RAM_OFFSET_REFRESH_COUNT_LSB] = 0xFE;

  #endif
  
  pinMode(INTERRUPT, OUTPUT);
  digitalWrite2(INTERRUPT, HIGH);
  
}

uint8_t GMECM::calcSRAMChecksum() {

  uint8_t checksum = 0;

  for (int i = 1; i <= MAX_RAM_ADDR_USED; ++i) {
   checksum = ((checksum + SRAMbuffer[i]) % 256);
  } 

  return checksum;
}

uint8_t GMECM::getSRAMChecksum() {

  return SRAMbuffer[RAM_OFFSET_CHECKSUM];
  
}

uint16_t GMECM::getSRAMRefreshCount() {

  uint16_t refreshCount = SRAMbuffer[RAM_OFFSET_REFRESH_COUNT_MSB];
  refreshCount = refreshCount << 8;
  refreshCount = refreshCount + SRAMbuffer[RAM_OFFSET_REFRESH_COUNT_LSB];

  return refreshCount;

}

uint8_t disconnected_one_time_refresh = 0;

uint8_t GMECM::refresh() {

  digitalWrite2(INTERRUPT, LOW);
  delay(1);
  digitalWrite2(INTERRUPT, HIGH);
  delay(10);

  #ifndef DISCONNECTED_MODE
    DualChannelSRAM::refreshToBuffer();
  #else
    //Serial.println(F("Disconnected Mode - Using sample data"));
  
    for (int i = disconnected_one_time_refresh; i <= 0xFD; ++i) {
      SRAM[i] = sample_data[i];
    }
    disconnected_one_time_refresh = 0xFD;
    
    uint32_t sampleRefreshCount = SRAM[RAM_OFFSET_REFRESH_COUNT_MSB];
    sampleRefreshCount = sampleRefreshCount << 8;
    sampleRefreshCount = sampleRefreshCount + SRAM[RAM_OFFSET_REFRESH_COUNT_LSB];      

    sampleRefreshCount = sampleRefreshCount + 1;
    
    SRAM[RAM_OFFSET_REFRESH_COUNT_LSB] = sampleRefreshCount % 256;
    SRAM[RAM_OFFSET_REFRESH_COUNT_MSB] = sampleRefreshCount >> 8;


  #endif

  if (calcSRAMChecksum() != getSRAMChecksum()) {
    #ifndef DISCONNECTED_MODE
      Serial.print(F("Checksum error - "));
      Serial.print(getSRAMChecksum(), HEX);
      Serial.print(F(" vs "));
      Serial.println(calcSRAMChecksum(), HEX);

      // Trigger logic analyzer
      digitalWrite2(A8, HIGH);
      delay(10);
      digitalWrite2(A8, LOW);

      for (int i = 0; i < 3; ++i) {
        Serial.println(F("Retrying and dumping differences:"));
        uint8_t SRAMretry[MAX_ADDR];
        memcpy(SRAMretry, SRAMbuffer, MAX_ADDR);
        DualChannelSRAM::refreshToBuffer();
        dumpDiffToSerial(SRAMbuffer, SRAMretry);
        if (calcSRAMChecksum() != getSRAMChecksum()) {
          Serial.println(F("Retry still had bad checksum"));
          if (i == 2) return ERROR_CHECKSUM;
        } else {
          Serial.println(F("Retry clean, using retry packet so long as refresh count is good"));
          break;
        }
      }
    #endif
  }
  
  uint32_t refreshCount = getSRAMRefreshCount();
  
  if (refreshCount <= lastRefreshCount) {
    if (refreshCount == 0 && lastRefreshCount == 0xFFFF) {
      #ifndef DISCONNECTED_MODE
      copyBufferToActual();
      #endif
      lastRefreshCount = refreshCount;
      return 0;
    }

    #ifndef DISCONNECTED_MODE
    Serial.print(F("Refresh Count Error - refreshCount = "));
    Serial.print(refreshCount);
    Serial.print(F(" lastRefreshCount = "));
    Serial.println(lastRefreshCount);
    #endif
        
    lastRefreshCount = refreshCount;
    return ERROR_REFRESH_COUNT;
  }

  #ifndef DISCONNECTED_MODE
  copyBufferToActual();
  #endif
  lastRefreshCount = refreshCount;
  return 0;
  
}

/*
                             L0007   EQU    $0007 ; MALF 1
;  b0 = C24 VEHICLE SPEED SENSOR
; b1 = C23 AIR FUEL SOLENOID
; b2 = NOT USED
; b3 = C21 THROTTLE POSITION SENSOR HIGH
; b4 = C15 OPEN COOLANT SENSOR
; b5 = C14 SHORTED COOLANT SENSOR
; b6 = C13 OXYGEN SENSOR CIRCUIT
; b7 = C12 NO DISTRIBUTOR REFERENCE PULSES TO ECM 
                            L0008   EQU    $0008 ;  MALF 2
; b0 = C42 EST MONITOR
; b1 = C41 TACH INPUT ERROR
; b2 = C35 ISC SWITCH CIRCUIT SHORTED
; b3 = C34 MAP OR VACUUM SENSOR CIRCUIT
; b4 = NOT USED
; b5 = C32 BARO CIRCUIT LOW
; b6 = NOT USED
; b7 = NOT USED 
                            L0009   EQU    $0009 ;  MALF 3
; b0 = C55 GROUNDED 5 VOLT REF, FAULTY O2 SENSOR, OR ECM
; b1 = C54 CARB MIXTURE CONTROL SOLENOID
; b2 = C53 EGR FAILURE
; b3 = NOT USED
; b4 = C51 FAULTY CALIBRATION UNIT (PROM ERROR)
; b5 = C45 RICH EXHAUST INDICATION
; b6 = C44 LEAN EXHAUST INDICATION
; b7 = C43 ESC FAILURE */



