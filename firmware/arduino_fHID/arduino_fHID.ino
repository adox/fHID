#include "RfidHID.h"

//#define _FHID_DEBUG_

const byte envInPin = 2;
const byte nOE = 7;  // n output enable

RfidHID hid(nOE);

void setup() {
  pinMode(envInPin, INPUT);
  
  Serial.begin(9600);
  Serial.println("fHID ready");
  
}

void loop() {
  hid.readData();
  //hid.printData();
  hid.convert();
  hid.printDataHex();
  hid.printCardNum();
  delay(1000);
}
