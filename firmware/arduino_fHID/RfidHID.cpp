#include "Arduino.h"
#include "RfidHid.h"

// wrappers //
// plain function for attaching to interrupt
void intEmulateWrapper() {
  Hid.emulator.intEmulate();
}

// plain function for attaching to interrupt
void intReadWrapper() {
  Hid.reader.intRead();
}

RfidHid::RfidHid() {
  pinMode(PIN_ENV_IN,  INPUT);
  pinMode(PIN_OCLK_IN, INPUT);
  pinMode(PIN_NOE_OUT, OUTPUT);
  pinMode(NRST,   OUTPUT);
  pinMode(BIT_IN, OUTPUT);
  pinMode(OCLK,   INPUT);
  pinMode(RE,     OUTPUT);

  genOE(OE_OFF); // shut off  
  reset(RESET_HOLD);
  
}

void RfidHid::reset(byte nr) {
   digitalWrite(NRST, nr);  
}

void RfidHid::genOE(byte oe) {
  digitalWrite(PIN_NOE_OUT, oe);
}

void RfidHid::mode(byte m) {
   reset(RESET_HOLD);
   digitalWrite(RE, m);
   delay(1);
}

byte RfidHid::read() {
  byte readStatus;
  
  mode(MODE_READ); 
  genOE(OE_ON);  
  reset(RESET_RUN); 
  readStatus = reader.read();
  
  genOE(OE_OFF);
  reset(RESET_HOLD);
  
  return readStatus;
};

byte RfidHid::emulate() { 
  byte emulateStatus;
  
  mode(MODE_EMU);  
  genOE(OE_OFF); 
  reset(RESET_RUN); 
  emulateStatus = emulator.emulate(); 
  
  reset(RESET_HOLD);
  
  return emulateStatus;
};


// instantinate
RfidHid Hid;
