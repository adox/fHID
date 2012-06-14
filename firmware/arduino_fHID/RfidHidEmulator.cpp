#include "Arduino.h"
#include "RfidHidEmulator.h"

void RfidHidEmulator::intEmulate() {

    outputBit(tagData.getDataNext());

    if( tagData.isEnd() ) {
      tagData.resetIndex();
      cycles++;
    }
    
};


byte RfidHidEmulator::emulate() {

  unsigned long startTime;
  byte exampleData[] = {0x00, 0x10, 0x2D, 0xD0, 0x62, 0x5A};

  //hex2raw(); // conversion
  reset();  
  tagData.loadHex( exampleData );
  tagData.printAll();
  tagData.encode();
  tagData.printEncoded();
  
  attachInterrupt(1, intEmulateWrapper, RISING);
  
  startTime = millis();
  while(cycles < EMULATE_CYCLES_MAX) {
    if(millis() - startTime > 1000) {

      timeout = 1;      
	  
      break;
    }
  };  
  
  detachInterrupt(1);

  return (timeout ? 0 : 1);  
}
