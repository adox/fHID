#ifndef _RFID_HID_TAG_DATA_
#define _RFID_HID_TAG_DATA_

#include "Arduino.h"

#define DATA_BUF_LEN 200

class RfidHidTagData {
  public:
    RfidHidTagData()       { clear(); };
    void clear()           { length = 0; index = 0; parity = 1; };
    void resetIndex()      { index = 0; };
    byte isFull()          { return (length >= DATA_BUF_LEN); };
    byte isEnd()           { return (index >= length); };
    byte getData(int i)    { return data[i]; };
    byte getDataNext()     { return data[index++]; };
    void loadHex(byte[]);
    void insertBit(byte b) { data[length++] = b; parity ^= b; };
    void insertLastBit(byte b) { data[length++] = b; };
    byte isParityOk()      { return (data[length - 1] == parity); };
    void printAll();
    void printBin();
    void printHex();
    void printCardNum();
	
  private:
    int  length;
    int  index;
    byte parity;
    byte data[DATA_BUF_LEN];
};

#endif
