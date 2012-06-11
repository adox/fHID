#include "Arduino.h"
#include "RfidHidTagData.h"

void RfidHidTagData::printAll() {
  Serial.print("Data bin: "); printBin();
  Serial.print("Data len: "); Serial.println(length, DEC);
  Serial.print("Data hex: "); printHex();
  Serial.print("Card num: "); printCardNum();  
  Serial.println();
};

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

  for( i = 18; i > 1; i--) {
    cardNum <<= 1;
    cardNum |= getData(i);
  }

  Serial.println(cardNum,DEC);
}
