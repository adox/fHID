#include "RfidHID.h"

#define THR 21
//#define _FHID_DEBUG_

#define DUR_LEN 20

const byte envInPin = 2;
const byte nOE = 7;  // n output enable
unsigned long duration[DUR_LEN];
unsigned long time;
int i;
byte dataReady;

char state;
enum {H1, H2, H3, READ5, PRINTOUT};

RfidHID hid(nOE);


void checkTiming() {

  if(i < DUR_LEN) {
    duration[i++] = micros() - time;
    time = micros();
    //duration[i++] = i;
  } else {
    dataReady = 1;
  }

}

void readData() {
  unsigned long startTime;
  
  #ifdef _FHID_DEBUG_
  Serial.println("Entering readData()");
  #endif
  
  dataReady = 0;
  i = 0;
  hid.genOE(1);  
  attachInterrupt(0, checkTiming, RISING); 

  #ifdef _FHID_DEBUG_
  Serial.println("Waiting for data to be ready...");  
  #endif
  
  startTime = millis();
  while(dataReady == 0) {
    if(millis() - startTime > 3000) {
      Serial.println("Timeout!");
      break;
    }
  };
  
  #ifdef _FHID_DEBUG_
  Serial.println("Data is ready");
  #endif

  detachInterrupt(0);
  hid.genOE(0);      
  
  for(i=1; i<DUR_LEN; i++) {
    Serial.print(duration[i], DEC);  
    Serial.print(" ");
  }
  Serial.println();
  
  #ifdef _FHID_DEBUG_
  Serial.println("Leaving readData()");  
  #endif
}

void setup() {
  pinMode(envInPin, INPUT);
  
  Serial.begin(9600);
  Serial.println("fHID ready");
  
}

void loop() {
  readData();
  delay(1000);
}
