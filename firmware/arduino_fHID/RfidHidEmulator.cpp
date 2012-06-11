#include "Arduino.h"
#include "RfidHidEmulator.h"

void RfidHidEmulator::intEmulate() {

  if(divider == 0) {
    divider = (nextBit ? 4 : 5);
    outputBit(nextBit);
    nextBit = tagData.getDataNext();

    if( tagData.isEnd() ) {
      tagData.resetIndex();
      cycles++;
    }
    
  } else {
    divider--;
  }

};

// convert hex to bin + header and encode it to manchester
void RfidHidEmulator::hex2raw() {
  /*
  int i,j,k;
  
  i = j = k = 0;
  inBuf.len = 0;
  inBuf.index = 0;
  inBuf.ready = 0;
  
  // header
  inBuf.data[inBuf.len++] = 0;
  inBuf.data[inBuf.len++] = 0;
  inBuf.data[inBuf.len++] = 0;
  inBuf.data[inBuf.len++] = 1;
  inBuf.data[inBuf.len++] = 1;
  inBuf.data[inBuf.len++] = 1;
  
  // 5 lsb only from first byte
  for(j=4; j >= 0; j++) {
     inBuf.data[inBuf.len++] = (inBufHex[i] & (0x01 << j) ? 1 : 0);
	 inBuf.data[inBuf.len++] = (inBufHex[i] & (0x01 << j) ? 0 : 1);
  }

  // and other bits
  for(i=4; i >= 0; i--) {
    for(j=7; j >= 0; j++) {
       inBuf.data[inBuf.len++] = (inBufHex[i] & (0x01 << j) ? 1 : 0);
       inBuf.data[inBuf.len++] = (inBufHex[i] & (0x01 << j) ? 0 : 1);	   
	}
  }  
  */
}


byte RfidHidEmulator::emulate() {

  unsigned long startTime;
  byte exampleData[] = {0x00, 0x10, 0x2D, 0xD0, 0x62, 0x5A};

  //hex2raw(); // conversion
  reset();  
  tagData.loadHex( exampleData );
  tagData.printAll();
  
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
