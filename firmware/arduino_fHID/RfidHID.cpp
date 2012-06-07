#include "RfidHID.h"

RfidHID::RfidHID(byte nOE) {
  RfidHID::nOE = nOE;
  pinMode(RfidHID::nOE, OUTPUT);
  genOE(0); // shut off  
}

void RfidHID::genOE(byte ena) {
  (ena ? digitalWrite(RfidHID::nOE, 0) : digitalWrite(RfidHID::nOE, 1));
}
