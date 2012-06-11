#include "RfidHid.h"

//#define _FHID_DEBUG_

byte inByte;

void setup() {
  Hid.begin();
  
  Serial.begin(9600);
  Serial.println("fHID ready");
  
}

void loop() {
  if (Serial.available() > 0) {
    inByte = Serial.read();
    
    switch(inByte) {
      case 'r':
        if(Hid.read())
          Hid.reader.tagData.printAll();
        else
          Serial.println("Timeout");
      break;
      
      case 'e':
        if(Hid.emulate())
          Serial.println("Emulate OK");
        else
          Serial.println("Emulate timeout");
      break;      
    }
  }
}
