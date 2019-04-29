#ifndef __GMECM1228079_h__
#define __GMECM1228079_h__

//#define DISCONNECTED_MODE 1

#include "DualChannelSRAM.h"

#define ANALOG_PIN_RIGHT_TURN          10
#define ANALOG_PIN_LEFT_TURN           11
#define ANALOG_PIN_FUEL_LEVEL          12
#define ANALOG_PIN_OIL_PRESSURE        13

#define MAX_RAM_ADDR_USED              0xDC

#define RAM_OFFSET_CHECKSUM            0xDF
#define RAM_OFFSET_REFRESH_COUNT_MSB   0xDD
#define RAM_OFFSET_REFRESH_COUNT_LSB   0xDE

#define RAM_OFFSET_BATT_VOLT           0x34
#define RAM_OFFSET_COOLANT_TEMP        0x35
#define RAM_OFFSET_VEHICLE_SPEED       0x4A
#define RAM_OFFSET_MAP                 0x20
#define RAM_OFFSET_KNOCK_COUNT         0x7F
#define RAM_OFFSET_TPS                 0x2F
#define RAM_OFFSET_O2                  0x3B // 0x3F
#define RAM_OFFSET_MC_DUTY_CYCLE       0xA2
#define RAM_OFFSET_MALF_1              0x07
#define RAM_OFFSET_MALF_2              0x08
#define RAM_OFFSET_MALF_3              0x09
#define RAM_OFFSET_CLCC                0x11
#define RAM_OFFSET_SES_LIGHT           0x18
#define RAM_OFFSET_EGR_DUTY_CYCLE      0xBB
#define RAM_OFFSET_ENGINE_RPM          0x1A
#define RAM_OFFSET_BARO                0x26
#define RAM_OFFSET_CROSS_COUNTS        0x8E
#define RAM_OFFSET_MAIN_SA             0x64
#define RAM_OFFSET_CALC_SA             0x6B
#define RAM_OFFSET_FINAL_SA            0x68
#define RAM_OFFSET_KNOCK_RETARD        0x83
#define RAM_OFFSET_ENGINE_RUN_TIME_MSB 0x4D
#define RAM_OFFSET_ENGINE_RUN_TIME_LSB 0x4E
#define RAM_OFFSET_COLD_START_COUNT    0xC1


#define ERROR_CHECKSUM               1
#define ERROR_REFRESH_COUNT          2

#define MAX_GMECM_VALUE 20
enum GMECM_VALUE_INDEX { VALUE_MPH = 0, VALUE_RPM = 1, VALUE_TPS = 2, VALUE_WOT = 3,
                         VALUE_CLOSED_LOOP = 4, VALUE_ENGINE_RUN_TIME = 5, VALUE_O2 = 6, VALUE_RICH_LEAN = 7,
                         VALUE_MAP = 8, VALUE_BARO = 9, VALUE_COOL_TEMP = 10, VALUE_BATT_V = 11, 
                         VALUE_MCS_DUTY = 12, VALUE_EGR_DUTY = 13, VALUE_CALC_SA = 14, VALUE_FINAL_SA = 15, 
                         VALUE_KNOCK = 16, VALUE_KNOCK_RETARD = 17, VALUE_MALF = 18, VALUE_SES_LIGHT = 19 };

#define MAX_SENSOR_VALUE 4
enum SENSOR_VALUE_INDEX { VALUE_RIGHT_TURN = 0, VALUE_LEFT_TURN = 1, VALUE_FUEL_LEVEL = 2,  VALUE_OIL_PRESSURE = 3 };

#define MAX_GMECM_LCD_PAGE 11
enum GMECM_LCD_PAGE_INDEX { LCD_PAGE_SPEED = 0, LCD_PAGE_THROTTLE = 1, LCD_PAGE_LOOP_STATUS = 2, LCD_PAGE_MIX = 3, 
                            LCD_PAGE_PRESSURE = 4, LCD_PAGE_COOL_BATT = 5, LCD_PAGE_DUTY_CYCLE = 6, LCD_PAGE_SA = 7, 
                            LCD_PAGE_KNOCK = 8, LCD_PAGE_MALF = 9, LCD_PAGE_FLUIDS = 10 };

#define VR_WORDSET_TRIGGER 4
#define VR_WORDSET_COMMAND 5

#define VR_GROUP_TRIGGER 0
#define VR_GROUP_COMMAND 2

enum VR_COMMAND_WORD { VR_COMMAND_SPEED = 0, VR_COMMAND_RPM = 1, VR_COMMAND_THROTTLE = 2, VR_COMMAND_LOOP_STATUS = 3,
                       VR_COMMAND_RUN_TIME = 4, VR_COMMAND_AIR_FUEL = 5, VR_COMMAND_PRESSURE = 6, VR_COMMAND_COOLANT = 7,
                       VR_COMMAND_BATTERY = 8, VR_COMMAND_SOLENOID = 9, VR_COMMAND_SPARK_ADVANCE = 10, VR_COMMAND_KNOCKS = 11,
                       VR_COMMAND_CYCLE_DISPLAY = 12, VR_COMMAND_TROUBLE_CODES = 13, VR_COMMAND_ERRORS = 14, VR_COMMAND_MAXIMUMS = 15,
                       VR_COMMAND_AVERAGES = 16, VR_COMMAND_FAVOURITE_SONG = 17, VR_COMMAND_RANDOM_SONG = 18, VR_COMMAND_CANCEL = 19, 
                       VR_COMMAND_COMMAND = 20 /* This last command is to try to filter false positives, acting as a secondary trigger */ };

class GMECM;

class VehicleValue {
public:
  virtual uint32_t decodeValue() = 0;
  virtual double decodeValueWithFraction() = 0;
  virtual String getTitleBar() = 0;
  virtual String getValueString() = 0;

};

class GMECMValue : public VehicleValue {
private:
  GMECM *ecm;

  static const uint8_t PROGMEM coolant_encode[];
  static const int8_t PROGMEM coolant_decode[];
  
public:
  void setup(GMECM *ecm, const String& ptitle, uint16_t poffset, double pfactor);
  void setup(GMECM *ecm, const String& ptitle, uint16_t poffset, uint8_t pmask, const String &pBooleanTrue, const String &pBooleanFalse);
  void setup(GMECM *ecm, const String& ptitle, uint16_t poffset, String pSpecialTable);   // for Coolant Temp
  void setup(GMECM *ecm, const String& ptitle, uint16_t poffsetMSB, uint16_t poffsetLSB, double pfactor); // for 16-bit #'s like run time
  void setup(GMECM *ecm, const String& ptitle, uint16_t poffsetMALF1, uint16_t poffsetMALF2, uint16_t poffsetMALF3);

  virtual uint32_t decodeValue();
  virtual double decodeValueWithFraction();
  virtual String getTitleBar();
  virtual String getValueString();
  
  String title;
  uint16_t offset;
  uint16_t offsetMSB;
  uint16_t offsetMALF;
  double factor;
  uint8_t mask;
  String specialTable;
  String booleanTrue;
  String booleanFalse;
};

class SensorValue : public VehicleValue {
private:
  GMECM *ecm;
  
public:
  void setup(GMECM *pecm, const String& ptitle, uint8_t panalogPin, double pmultiplier, uint8_t pacceleratedDecay);

  virtual uint32_t decodeValue();
  virtual double decodeValueWithFraction();
  virtual String getTitleBar();
  virtual String getValueString();

  String title;
  uint8_t analogPin;
  double multiplier;
  uint8_t acceleratedDecay;
  
};

class GMECMLCDPage {
private:
  GMECM *ecm;

public:
  void setup(GMECM *pecm, VehicleValue *value1, VehicleValue *value2 = 0);

  String getTitleBar();
  String getValueString();

  VehicleValue **column;
                   
};

class GMECM : public DualChannelSRAM {
private:
  uint8_t calcSRAMChecksum();

  uint8_t getSRAMChecksum();
  uint16_t getSRAMRefreshCount();

  
public:

  static const uint8_t MALFMap[32];

  GMECMValue ecmValue[MAX_GMECM_VALUE];
  SensorValue sensorValue[MAX_SENSOR_VALUE];
  GMECMLCDPage lcdPage[MAX_GMECM_LCD_PAGE];
  uint16_t lastRefreshCount;  

  GMECM();
  
  uint8_t refresh();
};

#endif


