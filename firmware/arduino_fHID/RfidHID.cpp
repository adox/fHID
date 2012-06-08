#include "RfidHID.h"



data_buffer in_buffer = { {0}, 0, 0 };

void timingDecode() {
  static volatile unsigned long duration;
  static volatile unsigned long time;
  
  if(in_buffer.len < RFID_BUF_LEN) {
    duration = micros() - time;
    time = micros();
    
    if(duration > 40) {
      if(duration < 66)
        in_buffer.data[in_buffer.len++] = 0;
      else if(duration < 90)
        in_buffer.data[in_buffer.len++] = 1;
    }

  } else { //  >= RFID_BUF_LEN
    in_buffer.ready = 1;
  }

}

RfidHID::RfidHID(byte nOE) {
  RfidHID::nOE = nOE;
  pinMode(RfidHID::nOE, OUTPUT);
  genOE(0); // shut off  
  
  inBuf = &in_buffer;
}

void RfidHID::genOE(byte ena) {
  (ena ? digitalWrite(RfidHID::nOE, 0) : digitalWrite(RfidHID::nOE, 1));
}


void RfidHID::readData() {
  unsigned long startTime;
  
  #ifdef _FHID_DEBUG_
  Serial.println("Entering readData()");
  #endif
  
  inBuf->ready = 0;
  inBuf->len = 0;
  timeout = 0;
  genOE(1);  
  attachInterrupt(0, timingDecode, RISING); 

  #ifdef _FHID_DEBUG_
  Serial.println("Waiting for data to be ready...");  
  #endif
  
  startTime = millis();
  while(inBuf->ready == 0) {
    if(millis() - startTime > 3000) {

      #ifdef _FHID_DEBUG_
      Serial.println("Timeout!");
      #endif

      timeout = 1;      
      break;
    }
  };
  
  #ifdef _FHID_DEBUG_
  Serial.println("Data is ready");
  #endif

  detachInterrupt(0);
  RfidHID::genOE(0);      
  
  #ifdef _FHID_DEBUG_
  Serial.println("Leaving readData()");  
  #endif
}

void RfidHID::printData() {
  int i;
  
  if(timeout) {
    Serial.println("Timeout");
  } else {
    for(i = 0; i < inBuf->len; i++) {
      Serial.print(inBuf->data[i]); 
    }
    Serial.println();
  }  
}


