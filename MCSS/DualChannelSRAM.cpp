#include "arduino2.h"
#include <stdint.h>

#include "DualChannelSRAM.h"

const uint8_t DualChannelSRAM::A[8] = { 23,22,25,24,27,26,29,28 };
const uint8_t DualChannelSRAM::D[8] = { 31,30,33,32,35,34,37,36 };

#define RW 38
#define CE 39
#define OE 41

//#define CE 38
//#define RW 39
//#define OE 40

DualChannelSRAM::DualChannelSRAM() {
  for (int i = 0; i < 8; ++i) {
    digitalWrite2(A[i],LOW);
    pinMode(A[i], OUTPUT);
    pinMode(D[i], INPUT_PULLUP);
  }

  pinMode(CE, OUTPUT);
  pinMode(RW, OUTPUT);
  pinMode(OE, OUTPUT);
  
  digitalWrite2(CE, HIGH);
  digitalWrite2(RW, HIGH);
  digitalWrite2(OE, HIGH);
}

void DualChannelSRAM::writeAddr(uint32_t addr) {

  uint32_t mask = 0x01;

  for (int i = 0; i < 8; ++i) {
    if ((mask & addr) != 0) {
      digitalWrite2(A[i],HIGH);
    } else { 
      digitalWrite2(A[i],LOW);
    }
    mask = mask << 1;
  }
}

  
uint8_t DualChannelSRAM::readByte() {

  uint8_t data = 0;
  uint8_t mask = 0x1;

  digitalWrite2(CE, LOW);
  digitalWrite2(OE, LOW);

  //delay(10);

  for (int i = 0; i < 8; ++i) {
    if (digitalRead2(D[i]) == HIGH) {
      data |= mask;
    }
    mask = mask << 1;
  }

  digitalWrite2(OE, HIGH);
  digitalWrite2(CE, HIGH);

  return data;

}

uint8_t DualChannelSRAM::readByte(uint32_t addr) {

  writeAddr(addr);
  return readByte();

}
  
void DualChannelSRAM::writeByte(uint8_t data) {

  uint8_t mask = 0x1;

  digitalWrite2(RW, LOW);
  digitalWrite2(CE, LOW);

  for (int i = 0; i < 8; ++i) {
    if ((data & mask) != 0) {
      digitalWrite2(D[i], HIGH);
    } else {
      digitalWrite2(D[i], LOW);
    }
    mask = mask << 1;
  }

  digitalWrite2(CE, HIGH);
  digitalWrite2(RW, HIGH);

}

void DualChannelSRAM::writeByte(uint32_t addr, uint8_t data) {

  writeAddr(addr);
  return writeByte(data);

}

void DualChannelSRAM::erase() {

  uint32_t addr = 0;

  for (int i = 0; i < 8; ++i) {
    pinMode(D[i], OUTPUT);
  }
  
  while (addr < MAX_ADDR) {
  
      writeAddr(addr);
      writeByte(0xEE);
      addr++;

  }

  for (int i = 0; i < 8; ++i) {
    pinMode(D[i], INPUT_PULLUP);
  }
}
  
void DualChannelSRAM::refreshToBuffer() {

  uint32_t addr = 0;

  while (addr < MAX_ADDR) {

     writeAddr(addr);
     SRAMbuffer[addr] = readByte();
     addr++; 

  }
    
}

void DualChannelSRAM::copyBufferToActual() {

  memcpy(SRAM, SRAMbuffer, MAX_ADDR);
  
}

void DualChannelSRAM::dumpToSerial() {

  uint32_t addr = 0;

  uint32_t checksum = 0;
  uint32_t ecm_checksum = 0;

  while (addr < MAX_ADDR) {

    Serial.print(addr, HEX);
    Serial.print(F(" : "));

     for (int i = 0; i < 16; i++) { 

       Serial.print(SRAMbuffer[addr], HEX); 
       Serial.print(F(" ")); 

       addr++; 
     } 
     Serial.println();
  }

}






