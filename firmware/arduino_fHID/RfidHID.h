#include "Arduino.h"
// lotos 000000001000000101101110100 00011000100101101 0
// flex

#define RFID_BUF_LEN 50

enum {MAN_HEAD_0, MAN_HEAD_1, MAN_DATA, MAN_STOP};

struct data_buffer {
  unsigned long data[RFID_BUF_LEN];
  int len;
  byte ready;
};

struct decoder_vars {
  byte state;
  byte count0;
  byte count1;
  byte prev;
};

class RfidHID {
  private:
     byte nOE;  // generator: n output enable pin
     data_buffer *inBuf;
    
  public:
     byte timeout;
     byte inBufHex[6];
    
     RfidHID(byte nOE);
     void genOE(byte ena);
     void readData();
     void convert();
     void printData();
     void printDataHex();
     void printCardNum();
    
     void writeData();  
};
