#include "RfidHID.h"

#define THR 21

const byte envInPin = 7;
const byte nOE = 2;  // n output enable
unsigned long duration[5];
int i;

char state;
enum {H1, H2, H3, READ5, PRINTOUT};

RfidHID hid(nOE);

/* Measures the length (in microseconds) of a pulse on the pin; state is HIGH
 * or LOW, the type of pulse to measure.  Works on pulses from 2-3 microseconds
 * to 3 minutes in length, but must be called at least a few dozen microseconds
 * before the start of the pulse. */
unsigned int myPulseIn(uint8_t pin, uint8_t state)
{
        // cache the port and bit of the pin in order to speed up the
        // pulse width measuring loop and achieve finer resolution.  calling
        // digitalRead() instead yields much coarser resolution.
        uint8_t bit = digitalPinToBitMask(pin);
        uint8_t port = digitalPinToPort(pin);
        uint8_t stateMask = (state ? bit : 0);
        unsigned int width = 0; // keep initialization out of time critical area
        
        // convert the timeout from microseconds to a number of times through
        // the initial loop; it takes 16 clock cycles per iteration.
        unsigned int numloops = 0;
        unsigned int maxloops = 2048;
        
        // disable interrupts
        cli();
        
        // wait for any previous pulse to end
        while ((*portInputRegister(port) & bit) == stateMask)
                if (numloops++ == maxloops)
                        return 0;
        
        // wait for the pulse to start
        while ((*portInputRegister(port) & bit) != stateMask)
                if (numloops++ == maxloops)
                        return 0;
        
        // wait for the pulse to stop
        while ((*portInputRegister(port) & bit) == stateMask)
                width++;

        // enable interrupts
        sei();
        
        return width; 
}

void setup() {
  pinMode(envInPin, INPUT);

  

  pinMode(nOE, OUTPUT);
  state = H1;
  digitalWrite(nOE, 1);
  
  Serial.begin(9600);
  Serial.println("fHID ready");
  
}

void loop() {
  
  hid.genOE(1);
  delay(100);
  hid.genOE(0);
  delay(100);
  
}
