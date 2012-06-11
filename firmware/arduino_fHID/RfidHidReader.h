#ifndef _RFID_HID_READER_
#define _RFID_HID_READER_

#include "RfidHidTagData.h"
#include "RfidHidReaderDecoder.h"

extern void intReadWrapper(); // in HidRfid.cpp

class RfidHidReader {
  public:
	RfidHidTagData tagData;
    byte           tagDataReady;
	byte           readTimeout;
	
	RfidHidReader() {};
	byte read();
	void intRead();
	
  private:
    RfidHidReaderDecoder decoder;
};

#endif
