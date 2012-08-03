#ifndef _RFID_HID_
#define _RFID_HID_

#include "RfidHidReader.h"
#include "RfidHidEmulator.h"

       

// pin definitions
#define PIN_ENV_IN  2
#define PIN_OCLK_IN 3
#define PIN_NOE_OUT 7
#define PIN_NOE_EMU 6

#define NRST 8
//#define BIT_IN 9 // moved to RfidHidEmulator
#define OCLK 3
#define RE 10

#define MODE_READ 1
#define MODE_EMU  0

#define RESET_HOLD 0
#define RESET_RUN  1

#define OE_ON  0
#define OE_OFF 1

#define RFID_BUF_LEN 100



class RfidHid {
  private:

    
  public:
    RfidHidReader   reader;
    RfidHidEmulator emulator;
    
    RfidHid();
    void begin() { };
    void reset(byte r);
    void genOE(byte ena);
    void emuOE(byte ena);
    void mode(byte m);
    byte read();
    byte emulate();
};

extern RfidHid Hid;

#endif
