#ifndef __GMECM1228079_h__
#define __GMECM1228079_h__

//#define DISCONNECTED_MODE 1

#include "DualChannelSRAM.h"

#define MAX_RAM_ADDR_USED            0xDC

#define RAM_OFFSET_CHECKSUM            0xDF
#define RAM_OFFSET_REFRESH_COUNT_MSB   0xDD
#define RAM_OFFSET_REFRESH_COUNT_LSB   0xDE

#define RAM_OFFSET_BATT_VOLT           0x34
#define RAM_OFFSET_COOLANT_TEMP        0x35
#define RAM_OFFSET_VEHICLE_SPEED       0x4A
#define RAM_OFFSET_MAP                 0x20
#define RAM_OFFSET_KNOCK_COUNT         0x7F
#define RAM_OFFSET_TPS                 0x2F
#define RAM_OFFSET_O2                  0x3B
#define RAM_OFFSET_MC_DUTY_CYCLE       0xA2
#define RAM_OFFSET_MALF_1              0x07
#define RAM_OFFSET_MALF_2              0x08
#define RAM_OFFSET_MALF_3              0x09
#define RAM_OFFSET_CLCC                0x11
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
#define RAM_OFFSET_CYCLES_LEFT_OPEN    0xB3


#define ERROR_CHECKSUM               1
#define ERROR_REFRESH_COUNT          2

#define MAX_GMECM_VALUE 21
enum GMECM_VALUE_INDEX { VALUE_MPH = 0, VALUE_RPM = 1, VALUE_TPS = 2, VALUE_WOT = 3,
                         VALUE_COLD_START = 4, VALUE_CLOSED_LOOP = 5, VALUE_ENGINE_RUN_TIME = 6, VALUE_CYCLES_LEFT_OPEN = 7,
                         VALUE_O2 = 8, VALUE_RICH_LEAN = 9, VALUE_MAP = 10, VALUE_BARO = 11, 
                         VALUE_COOL_TEMP = 12, VALUE_BATT_V = 13, VALUE_MCS_DUTY = 14, VALUE_EGR_DUTY = 15, 
                         VALUE_CALC_SA = 16, VALUE_FINAL_SA = 17, VALUE_KNOCK = 18, VALUE_KNOCK_RETARD = 19,
                         VALUE_MALF = 20};

#define MAX_GMECM_LCD_PAGE 11
enum GMECM_LCD_PAGE_INDEX { LCD_PAGE_SPEED = 0, LCD_PAGE_THROTTLE = 1, LCD_PAGE_LOOP_STATUS = 2, LCD_PAGE_RUN_TIME = 3,
                            LCD_PAGE_MIX = 4, LCD_PAGE_PRESSURE = 5, LCD_PAGE_COOL_BATT = 6, LCD_PAGE_DUTY_CYCLE = 7,
                            LCD_PAGE_SA = 8, LCD_PAGE_KNOCK = 9, LCD_PAGE_MALF = 10};

#define VR_WORDSET_TRIGGER 4
#define VR_WORDSET_COMMAND 5

#define VR_GROUP_TRIGGER 0
#define VR_GROUP_COMMAND 2

enum VR_COMMAND_WORD { VR_COMMAND_SPEED = 0, VR_COMMAND_RPM = 1, VR_COMMAND_THROTTLE = 2, VR_COMMAND_LOOP_STATUS = 3,
                       VR_COMMAND_RUN_TIME = 4, VR_COMMAND_AIR_FUEL = 5, VR_COMMAND_PRESSURE = 6, VR_COMMAND_COOLANT = 7,
                       VR_COMMAND_BATTERY = 8, VR_COMMAND_SOLENOID = 9, VR_COMMAND_SPARK_ADVANCE = 10, VR_COMMAND_KNOCKS = 11,
                       VR_COMMAND_CYCLE_DISPLAY = 12, VR_COMMAND_TROUBLE_CODES = 13, VR_COMMAND_ERRORS = 14, VR_COMMAND_MAXIMUMS = 15,
                       VR_COMMAND_AVERAGES = 16, VR_COMMAND_FAVOURITE_SONG = 17, VR_COMMAND_RANDOM_SONG = 18, VR_COMMAND_CANCEL = 19};

class GMECM;

class GMECMValue {
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

  uint32_t decodeValue();
  double decodeValueWithFraction();
  String getTitleBar();
  String getValueString();
  
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

class GMECMLCDPage {
private:
  GMECM *ecm;

public:
  void setup(GMECM *pecm, GMECMValue *value1, GMECMValue *value2 = 0);

  String getTitleBar();
  String getValueString();

  GMECMValue **column;
                   
};

class GMECM : public DualChannelSRAM {
private:
  uint8_t calcSRAMChecksum();

  uint8_t getSRAMChecksum();
  uint16_t getSRAMRefreshCount();

  
public:

  static const uint8_t MALFMap[32];

  GMECMValue ecmValue[MAX_GMECM_VALUE];
  GMECMLCDPage lcdPage[MAX_GMECM_LCD_PAGE];
  uint16_t lastRefreshCount;  

  GMECM();
  
  uint8_t refresh();
};

#endif


