#ifndef _RFID_HID_
#define _RFID_HID_

#include "Arduino.h"
// lotos  000000001000000101101110100 00011000100101101 0
// lotos  000000001000000101101110100000110001001011010, 102DD0625A
// flex   
//        000000010000100000000100001 11000100010111111 1, 210087117F
//        00000001000010000000010000111000100010111111 1
//            

// pin definitions
#define NRST 8
#define BIT_IN 9
#define OCLK 3
#define RE 10

#define MODE_READ 1
#define MODE_EMU  2

#define RFID_BUF_LEN 100

enum {MAN_HEAD_0, MAN_HEAD_1, MAN_DATA, MAN_STOP};

extern byte emulate_div;
extern byte emulateNextBit;

struct data_buffer {
  unsigned long data[RFID_BUF_LEN];
  int len;
  int index;
  byte ready;
  byte emulateCount;
};

struct decoder_vars {
  byte state;
  byte count0;
  byte count1;
  byte prev;
  byte parity;
};

class RfidHID {
  private:
     byte nOE;  // generator: n output enable pin
     data_buffer *inBuf;
    
  public:
     byte timeout;
     byte inBufHex[6];
    
     RfidHID(byte nOE);
     void reset(byte r);
     void genOE(byte ena);
     void mode(byte m);
     byte readData();
     void convert();
     void printData();
     void printDataHex();
     void printCardNum();
     void printDataAll();
    
     byte emulateData();  
};

#endif
