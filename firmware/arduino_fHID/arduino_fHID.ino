#include "RfidHID.h"

//#define _FHID_DEBUG_

const byte envInPin = 2;
const byte oclkPin = 3;
const byte nOE = 7;  // n output enable
byte inByte;

RfidHID hid(nOE);

void setup() {
  pinMode(envInPin, INPUT);
  pinMode(oclkPin, INPUT);
  
  Serial.begin(9600);
  Serial.println("fHID ready");
  
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    
    switch(inByte) {
      case 'r':
        if(hid.readData())
          hid.printDataAll();
        else
          Serial.println("Timeout");
      break;
      
      case 'e':
        if(hid.emulateData())
          Serial.println("Emulate OK");
        else
          Serial.println("Emulate timeout");
      break;      
    }
  }
}
