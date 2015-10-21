#ifndef __DualChannelSRAM_h__
#define __DualChannelSRAM_h__

// Set MAX_ADDR to the largest address you need
// to read. For example, for the 27C512 chips,
// you'll want to use a MAX_ADDR of 65536.
// (That's 512 * 1024 / 8.)
// A 27C256 would be 256 kilobits, or 256 * 1024 / 8 =
// 32768.
#define MAX_ADDR 256

class DualChannelSRAM {
private:
  void writeAddr(uint32_t addr);
  uint8_t readByte();
  uint8_t readByte(uint32_t addr);
  void writeByte(uint8_t data);
  void writeByte(uint32_t addr, uint8_t data);

  static const uint8_t A[8];
  static const uint8_t D[8]; 

public:

  uint8_t SRAMbuffer[MAX_ADDR];
  uint8_t SRAM[MAX_ADDR];

  DualChannelSRAM();
  void erase();
  void refreshToBuffer();
  void copyBufferToActual();
  void dumpToSerial();
};

#endif;



