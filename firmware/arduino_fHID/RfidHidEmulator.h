#ifndef _RFID_HID_EMULATOR_
#define _RFID_HID_EMULATOR_

#include "RfidHidTagData.h"

extern void intEmulateWrapper(); // in RfidHid.cpp

class RfidHidEmulator {
  public:
    byte emulate_div;
    byte emulateNextBit;

    byte emulate();
	void intEmulate();
	void hex2raw(); // convert hex data to bit train + header	

};

#endif
