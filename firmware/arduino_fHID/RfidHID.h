#include "Arduino.h"

#define RFID_BUF_LEN 100

struct data_buffer {
  unsigned long data[RFID_BUF_LEN];
  int len;
  byte ready;
};

class RfidHID {
  private:
     byte nOE;  // generator: n output enable pin
     data_buffer *inBuf;
    
  public:
     byte timeout;
    
     RfidHID(byte nOE);
     void genOE(byte ena);
     void readData();
     void printData();
    
     void writeData();  
};
