#include "Arduino.h"
#include "RfidHidReader.h"

byte RfidHidReader::read() {
  unsigned long startTime;
  
  tagData.clear();
  decoder.reset();
  readTimeout = 0;
  tagDataReady = 0;

  attachInterrupt(0, intReadWrapper, RISING); 

  startTime = millis();
  while(tagDataReady == 0) {
    if(millis() - startTime > 3000) {

      readTimeout = 1;      
	  
      break;
    }
  };
  
  detachInterrupt(0);
  
  return (readTimeout ? 0 : 1);    
}




#define mCapture0() (duration > 40 && duration < 66)
#define mCapture1() (duration >= 66 && duration < 90)

void RfidHidReader::intRead() {
  static unsigned long duration;
  static unsigned long time;
  
  if( !tagData.isFull() && !tagDataReady ) {
    // check period
    duration = micros() - time;
    time = micros();
    
    switch( decoder.getState() ) {
      case DECODER_STATE_HEAD_0:  
        if( mCapture0() )
          decoder.count0++;
        else {
          if(decoder.count0 >= 16) {
            decoder.state = DECODER_STATE_HEAD_1;  
          }
          
          decoder.count1 = 1;
          decoder.count0 = 0;
        }
        break;
        
      case DECODER_STATE_HEAD_1:
        if( mCapture1() )
          decoder.count1++;
        else {
          if(decoder.count1 >= 14) {
            decoder.state = DECODER_STATE_DATA;
          } else
            decoder.state = DECODER_STATE_HEAD_0;
            
          decoder.count1 = 0;
          decoder.count0 = 1;          
        }
        break;
        
      case DECODER_STATE_DATA:
        if( mCapture1() ) {
          if( decoder.count0 >= 22 ) {
            // zero and start of header - quit
            if(decoder.prev == 1) {
              // since this is last bit, insert bit without parity calculation
			  tagData.insertLastBit(1);
              
              // check parity
              if( tagData.isParityOk() )
                tagDataReady = 1;
              else {
                // error - go to start
				tagData.clear();
				decoder.reset();
              } 
              break;
            } else {
              // error - go to start
              decoder.state = DECODER_STATE_ERROR;
              break;
            } 
          
          } else if( decoder.count0 >= 16 ) {
            // start of header - quit
            // but first check parity
		    // check parity
		    if( tagData.isParityOk() )
			  tagDataReady = 1;
		    else {
			  // error - go to start
                          decoder.state = DECODER_STATE_ERROR;
		    } 

            break;  
          
          } else if( decoder.count0 >= 9 ) {
            // data: 00
            if(decoder.prev == 1) {
              tagData.insertBit(1);
              decoder.prev = 0;
            } else {
            // error - go to start  
              decoder.state = DECODER_STATE_ERROR;
            }
          
          } else if( decoder.count0 >= 4 ) {
            // data: 0
            if(decoder.prev == 1) {
              tagData.insertBit(1);
              decoder.prev = 'X';            
            } else {
              decoder.prev = 0;
            }  
          }
          
          decoder.count0 = 0;
          decoder.count1++;
        }
        
        else if( mCapture0() ) {
          if( decoder.count1 >= 9 ) {
            // data: 11
            if(decoder.prev == 0) {
              tagData.insertBit(0);
              decoder.prev = 1;
            } else {
            // error - go to start  
              decoder.state = DECODER_STATE_ERROR;
            }
        
          } else if( decoder.count1 >= 4 ) {
            // data: 1
            if(decoder.prev == 0) {
              tagData.insertBit(0);
              decoder.prev = 'X';
            } else {
              decoder.prev = 1;
            }
          }
          
          decoder.count1 = 0;
          decoder.count0++;
        }
        break;
        
		case DECODER_STATE_ERROR:
			tagData.clear();
			decoder.reset();
		break;
		
    }
  } 
}
