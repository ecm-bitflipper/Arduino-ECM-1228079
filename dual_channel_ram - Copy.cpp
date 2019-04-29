#include <Arduino.h>
#include <stdint.h>



// Set MAX_ADDR to the largest address you need
// to read. For example, for the 27C512 chips,
// you'll want to use a MAX_ADDR of 65536.
// (That's 512 * 1024 / 8.)
// A 27C256 would be 256 kilobits, or 256 * 1024 / 8 =
// 32768.
#define MAX_ADDR 0xDF

// On my board, I've connected pins 26-41
// to the A0-A15 lines, and pins 2-10 to the
// Q0-Q7 lines. You'll want to change these
// pin choices to match your setup.
#define A0 38
#define Q0 22

#define CE 23
#define RW 25
#define OE 27

uint32_t errors = 0;
uint32_t cycle = 0;

// When you're all wired up, hit the reset button
// to start dumping the hex codes.

void dual_channel_ram_setup() {
  for (int i = A0; i < A0+16; i=i+2) {
    digitalWrite(i,LOW);
    pinMode(i, OUTPUT);
  }

  pinMode(CE, OUTPUT);
  pinMode(RW, OUTPUT);
  pinMode(OE, OUTPUT);
  
  digitalWrite(CE, LOW);
  digitalWrite(RW, HIGH);
  digitalWrite(OE, HIGH);
  Serial.begin(115200);
}

void dual_channel_ram_write_addr(uint32_t addr) {
  uint32_t mask = 0x01;
  for (int i = A0; i < A0+16; i=i+2) {
    if ((mask & addr) != 0) {
      digitalWrite(i,HIGH);
    } else { 
      digitalWrite(i,LOW);
    }
    mask = mask << 1;
  }
}


uint8_t dual_channel_ram_read_byte() {
  uint8_t data = 0;
  uint8_t mask = 0x1;

  digitalWrite(OE, LOW);

  // delay(1);

  for (int i = Q0; i < Q0+16; i=i+2) {
    if (digitalRead(i) == HIGH) {
      data |= mask;
    }
    mask = mask << 1;
  }

  digitalWrite(OE, HIGH);

  return data;
}

uint8_t dual_channel_ram_write_byte(uint8_t data) {
  uint8_t mask = 0x1;

  digitalWrite(RW, LOW);
  for (int i = Q0; i < Q0+16; i=i+2) {
    if ((data & mask) != 0) {
      digitalWrite(i, HIGH);
    } else {
      digitalWrite(i, LOW);
    }
    mask = mask << 1;
  }
  digitalWrite(RW, HIGH);

  return data;
}

void dual_channel_ram_dump() {
  uint32_t addr = 0;

  for (int i = Q0; i < Q0+16; i=i+2) {
    pinMode(i, INPUT_PULLUP);
  }  

  while (addr < MAX_ADDR) {
      dual_channel_ram_write_addr(addr);
      uint8_t b = dual_channel_ram_read_byte();
      if (b != addr) { 
        ++errors;
        Serial.print(addr, HEX);
        Serial.print(" : ");
        Serial.print(b, HEX);
        Serial.print(" - ERRORS : ");
        Serial.print(errors);
        Serial.println("");
      }
    
      addr++;
  }

  ++cycle;
  Serial.print("Cycle: ");
  Serial.print(cycle);
  Serial.print(" - Errors: ");
  Serial.println(errors);
}

void dual_channel_test_write_ram() {
  uint32_t addr = 0;

  for (int i = Q0; i < Q0+16; i=i+2) {
    pinMode(i, OUTPUT);
  }  
  
  while (addr < MAX_ADDR) {
      dual_channel_ram_write_addr(addr);
      dual_channel_ram_write_byte(addr);
      
      Serial.print("WRITE - ");
      Serial.print(addr, HEX);
      Serial.print(" : ");
      Serial.print(addr, HEX);
      addr++;
      Serial.println("");
  }

}

