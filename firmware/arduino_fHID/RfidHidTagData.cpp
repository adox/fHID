#include "Arduino.h"
#include "RfidHidTagData.h"

void RfidHidTagData::printAll() {
  Serial.print("Data bin: "); printBin();
  Serial.print("Data len: "); Serial.println(length, DEC);
  Serial.print("Data hex: "); printHex();
  Serial.print("Card num: "); printCardNum();  
  Serial.println();
};

void RfidHidTagData::printEncoded() {
  Serial.print("Data bin: "); printBin();
  Serial.println();  
}

void RfidHidTagData::printBin() {

  for(int i = 0; i < length; i++) {
    Serial.print( getData(i) ); 
  }
  
  Serial.println();
}

void RfidHidTagData::printHex() {

  byte hexData[6] = {0, 0, 0, 0, 0, 0};
  int i,j,k;
  
  i = j = k = 0;
  
  // convert
  for( j = length - 1; j >= 0; j-- ) {
    hexData[i] |= getData(j) << k;
    k++;
    if(k >= 8) {
      k = 0;
      if(i < 5)
        i++;
      else
        break;
    }
  }

  // printout  
  for(i=5; i >= 0; i--) {
    Serial.print(hexData[i], HEX);
    Serial.print(" ");
  }  
  Serial.println();

}

void RfidHidTagData::printCardNum() {
  unsigned long cardNum = 0;
  int i;

  for( i = length - 18; i < length - 1; i++) {
    cardNum <<= 1;
    cardNum |= getData(i);
  }

  Serial.println(cardNum,DEC);
}

// load data
void RfidHidTagData::loadHex(byte data[]) {
  int i,j;
  
  clear();
  
  for(j = 4; j >= 0; j--)
    insertBit( (data[0] & (0x01 << j) ? 1 : 0) );
    
  for(i = 1; i <= 5; i++) {
    for(j = 7; j >= 0; j--)
      insertBit( (data[i] & (0x01 << j) ? 1 : 0) );
  }
}

// encode loaded data to machester + header
void RfidHidTagData::encode() {
	byte dataCopy[DATA_BUF_LEN];
	int lengthCopy;
	
	memcpy(dataCopy, data, length); // store original data to temp buffer
	lengthCopy = length;			// store length
	
	clear();
	insertBit(0);	// header 3 x 0 + 3 x 1
	insertBit(0);
	insertBit(0);
	insertBit(1);
	insertBit(1);
	insertBit(1);
	
	for(int i = 0; i < lengthCopy; i++) {
		if( dataCopy[i] == 1 ) {
			insertBit( 1 );
			insertBit( 0 );
		} else {
			insertBit( 0 );
			insertBit( 1 );
		}			
	}
}
