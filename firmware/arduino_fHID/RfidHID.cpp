#include "RfidHID.h"



data_buffer in_buffer = { {0}, 0, 0 };
decoder_vars decoder = {0, 0, 0, 'X'};

#define mCapture0() (duration > 40 && duration < 66)
#define mCapture1() (duration >= 66 && duration < 90)

void timingDecode() {
  static unsigned long duration;
  static unsigned long time;
  
  if(in_buffer.len < RFID_BUF_LEN && in_buffer.ready == 0) {
    // check period
    duration = micros() - time;
    time = micros();
    
    switch(decoder.state) {
      case MAN_HEAD_0:  
        if( mCapture0() )
          decoder.count0++;
        else {
          if(decoder.count0 >= 16) {
            decoder.state = MAN_HEAD_1;  
          }
          
          decoder.count1 = 1;
          decoder.count0 = 0;
        }
        break;
        
      case MAN_HEAD_1:
        if( mCapture1() )
          decoder.count1++;
        else {
          if(decoder.count1 >= 14) {
            decoder.state = MAN_DATA;
          } else
            decoder.state = MAN_HEAD_0;
            
          decoder.count1 = 0;
          decoder.count0 = 1;          
        }
        break;
        
      case MAN_DATA:
        if( mCapture1() ) {
          if( decoder.count0 >= 22 ) {
            // zero and start of header - quit
            if(decoder.prev == 1) {
              in_buffer.data[in_buffer.len++] = 1;
              in_buffer.ready = 1;
              break;
            } else {
              // error - go to start
              decoder.count0 = 0;
              decoder.count1 = 0;              
              decoder.state = MAN_HEAD_0;
              break;
            } 
          
          } else if( decoder.count0 >= 16 ) {
            // start of header - quit
            in_buffer.ready = 1;
            break;  
          
          } else if( decoder.count0 >= 9 ) {
            // data: 00
            if(decoder.prev == 1) {
              in_buffer.data[in_buffer.len++] = 1;
              decoder.prev = 0;
            } else {
            // error - go to start  
              decoder.count0 = 0;
              decoder.count1 = 0;              
              decoder.state = MAN_HEAD_0;            
            }
          
          } else if( decoder.count0 >= 4 ) {
            // data: 0
            if(decoder.prev == 1) {
              in_buffer.data[in_buffer.len++] = 1;
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
              in_buffer.data[in_buffer.len++] = 0;
              decoder.prev = 1;
            } else {
            // error - go to start  
              decoder.count0 = 0;
              decoder.count1 = 0;              
              decoder.state = MAN_HEAD_0;                
            }
        
          } else if( decoder.count1 >= 4 ) {
            // data: 1
            if(decoder.prev == 0) {
              in_buffer.data[in_buffer.len++] = 0;
              decoder.prev = 'X';
            } else {
              decoder.prev = 1;
            }
          }
          
          decoder.count1 = 0;
          decoder.count0++;
        }
        break;
        
      case MAN_STOP:
        break;
    }

  } else { //  >= RFID_BUF_LEN
    in_buffer.ready = 1;
  }

}

RfidHID::RfidHID(byte nOE) {
  RfidHID::nOE = nOE;
  pinMode(RfidHID::nOE, OUTPUT);
  genOE(0); // shut off  
  
  inBuf = &in_buffer;
}

void RfidHID::genOE(byte ena) {
  (ena ? digitalWrite(RfidHID::nOE, 0) : digitalWrite(RfidHID::nOE, 1));
}


void RfidHID::readData() {
  unsigned long startTime;
  
  #ifdef _FHID_DEBUG_
  Serial.println("Entering readData()");
  #endif
  
  inBuf->ready = 0;
  inBuf->len = 0;
  
  // init struct decoder
  decoder.state = MAN_HEAD_0;
  decoder.count0 = 0;
  decoder.count1 = 0;
  
  timeout = 0;
  genOE(1);  
  attachInterrupt(0, timingDecode, RISING); 

  #ifdef _FHID_DEBUG_
  Serial.println("Waiting for data to be ready...");  
  #endif
  
  startTime = millis();
  while(inBuf->ready == 0) {
    if(millis() - startTime > 3000) {

      #ifdef _FHID_DEBUG_
      Serial.println("Timeout!");
      #endif

      timeout = 1;      
      break;
    }
  };
  
  #ifdef _FHID_DEBUG_
  Serial.println("Data is ready");
  #endif

  detachInterrupt(0);
  RfidHID::genOE(0);      
  
  #ifdef _FHID_DEBUG_
  Serial.println("Leaving readData()");  
  #endif
}

void RfidHID::printData() {
  int i;
  
  //if(timeout) {
  if(0) {
    Serial.println("Timeout");
  } else {
    for(i = 0; i < inBuf->len; i++) {
      Serial.print(inBuf->data[i]); 
      //Serial.print(" ");
    }
    Serial.println();
  }  
}

void RfidHID::convert() {
  //end = len - 1
  int i,j,k;
  
  i = 0;
  k = 0;
  
  for( j = inBuf->len - 1; j >= 0; j-- ) {
    inBufHex[i] |= inBuf->data[j] << k;
    k++;
    if(k >= 8) {
      k = 0;
      if(i < 5)
        i++;
      else
        break;
    }
  }
}

void RfidHID::printDataHex() {
  int i;
  for(i=5; i > 0; i--) {
    Serial.print(inBufHex[i], HEX);
    Serial.print(" ");
  }  
  Serial.println();
}

void RfidHID::printCardNum() {
  unsigned long num;

  num = (inBufHex[2] << 16) | (inBufHex[1] << 8) | (inBufHex[0]);
  num >>= 1; // shift out parity
  num &= 0x1ffff; // mask only 17 lsb's
  
  Serial.println(num,DEC);
}

