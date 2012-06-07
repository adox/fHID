#include "Arduino.h"

class RfidHID {
  private:
    byte nOE;  // generator: n output enable pin
  public:
    RfidHID(byte nOE);
    void genOE(byte ena);
    void readData();
    void writeData();  
};
