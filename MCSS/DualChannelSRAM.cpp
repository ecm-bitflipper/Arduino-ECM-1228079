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
    pinMode2(A[i], OUTPUT);
    pinMode2(D[i], INPUT);
  }

  pinMode2(CE, OUTPUT);
  pinMode2(RW, OUTPUT);
  pinMode2(OE, OUTPUT);
  
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

/*
 * This version of readByte implements a noise filter of sorts due to very occasional glitches that I wish I could solve with hardware
 * Read a maximum of 9 times.  If the same byte is read 3 times in a row, return it immediately.  If all 9 reads occur without 3 the same
 * in a row, return the byte that was seen most often over the 9 reads.
 */
/*
#define MAX_READ_COUNT 9

uint8_t DualChannelSRAM::readByte() {

  uint8_t read_count = 0;
  uint8_t reads[MAX_READ_COUNT];
  
  while (read_count < MAX_READ_COUNT) {

    digitalWrite2(CE, LOW);

    uint8_t mask = 0x1;
    reads[read_count] = 0;

    for (int i = 0; i < 8; ++i) {
      digitalWrite2(OE, LOW);
      if (digitalRead2(D[i]) == HIGH) {
        reads[read_count] |= mask;
      }
      digitalWrite2(OE, HIGH);
      mask = mask << 1;
    }

    digitalWrite2(CE, HIGH);

    if (read_count >= 2) {
      if (reads[read_count] == reads[read_count-1] && reads[read_count] == reads[read_count-2]) break;
    }

    ++read_count;

  }


  if (read_count < MAX_READ_COUNT) return reads[read_count];
  else {
    uint8_t reads_freq[256];
    memset(reads_freq, 0, 256 * sizeof(uint8_t));
    for (int i = 0; i < MAX_READ_COUNT; ++i) ++reads_freq[reads[i]];
    int reads_most = 0;
    for (int i = 1; i < MAX_READ_COUNT; ++i) {
      if (reads_freq[reads[i]] >= reads_freq[reads[reads_most]]) reads_most = i;
    }
    Serial.print(F("readByte error correction - "));
    Serial.print(reads[reads_most]);
    Serial.print(F(" read "));
    Serial.print(reads_freq[reads[reads_most]]);
    Serial.println(F(" times"));
    return reads[reads_most];
  }

}
*/

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
    pinMode2(D[i], OUTPUT);
  }
  
  while (addr < MAX_ADDR) {
  
      writeAddr(addr);
      writeByte(0xEE);
      addr++;

  }

  for (int i = 0; i < 8; ++i) {
    pinMode2(D[i], INPUT);
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

void DualChannelSRAM::dumpDiffToSerial(uint8_t *SRAM1, uint8_t *SRAM2) {

  uint32_t addr = 0;

  uint8_t diff[MAX_ADDR];

  while (addr < MAX_ADDR) {

    Serial.print(addr, HEX);
    Serial.print(F(" : "));

     for (int i = 0; i < 16; i++) { 

       Serial.print(SRAM1[addr], HEX);
       Serial.print(F("/"));
       Serial.print(SRAM2[addr], HEX);
       Serial.print(F(" ")); 

       if (SRAM1[addr] == SRAM2[addr]) diff[addr] = 0;
       else diff[addr] = 1;

       addr++; 
     } 
     Serial.println();
  }
  Serial.print(F("Differences at bytes: "));
  for (int i = 0; i < MAX_ADDR; ++i) {
    if (diff[i]) {
      Serial.print(i, HEX);
      Serial.print(F(" "));
    }
  }
  Serial.println();
  Serial.println();

}

