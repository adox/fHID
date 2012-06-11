#ifndef _RFID_HID_READER_DECODER_
#define _RFID_HID_READER_DECODER_

// state enumeration
enum { 
  DECODER_STATE_HEAD_0, 
  DECODER_STATE_HEAD_1, 
  DECODER_STATE_DATA, 
  DECODER_STATE_ERROR
  };  

class RfidHidReaderDecoder {
  public:

    byte state;
    byte count0;
    byte count1;
    byte prev;
	
	RfidHidReaderDecoder()       { reset(); };
	void reset()    { state = DECODER_STATE_HEAD_0; count0 = 0; count1 = 0; prev = 'X'; };
	byte getState() { return state; };

};

#endif
