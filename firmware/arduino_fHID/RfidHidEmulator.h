#ifndef _RFID_HID_EMULATOR_
#define _RFID_HID_EMULATOR_

#include "RfidHidTagData.h"

#define BIT_IN 9
#define EMULATE_CYCLES_MAX 3

extern void intEmulateWrapper(); // in RfidHid.cpp

class RfidHidEmulator {
  public:
    byte divider;
    byte nextBit;
    byte timeout;
    byte cycles;
    RfidHidTagData tagData;

    RfidHidEmulator() { reset(); };
    byte reset() { divider = 0; timeout = 0; cycles = 0; };
    byte emulate();     // to start emulation
    void intEmulate();  // attached to interrupt (indirectly by plain function)
    void outputBit(byte b) { digitalWrite(BIT_IN, b); };
    void hex2raw(); // convert hex data to bit train + header	

};

#endif
