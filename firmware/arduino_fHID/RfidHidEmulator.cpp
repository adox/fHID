#include "Arduino.h"
#include "RfidHidEmulator.h"

void RfidHidEmulator::intEmulate() {
  /*
  if(emulate_div == 0) {
    emulate_div = (emulateNextBit ? 4 : 5);
    //digitalWrite(BIT_IN, emulateNextBit);
    emulateNextBit = in_buffer.data[++in_buffer.index];

    if(in_buffer.index >= in_buffer.len) {
      in_buffer.index = 0;
      in_buffer.emulateCount++;
    }
    
  } else {
    emulate_div--;
  }
  */
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
/*
  unsigned long startTime;

  hex2raw();
  printDataAll();
  
  inBuf.index = 0;
  inBuf.ready = 0;
  inBuf.emulateCount = 0;

  emulate_div = 0;
  
  mode(MODE_EMU);  
  attachInterrupt(1, emulate, RISING);
  reset(RESET_RUN);
  
  startTime = millis();
  while(inBuf->emulateCount < 3) {
    if(millis() - startTime > 1000) {

      timeout = 1;      
	  
      break;
    }
  };  
  
  reset(RESET_HOLD);
  detachInterrupt(1);

  return (timeout ? 0 : 1);  
  */
}
