/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#include <htc.h>            /* HiTech General Includes */
#include <stdint.h>         /* For uint8_t definition */
#include <stdbool.h>        /* For true/false definition */

#include "user.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* <Initialize variables in user.h and insert code for user algorithms.> */

void InitApp(void)
{
    /* TODO Initialize User Ports/Peripherals/Project here */

    /* Setup analog functionality and port direction */

    /* Initialize peripherals */
    /* init CCP1 125 kHz 50% DT */
    TRISIO  = 0b11111111;
    PR2     = 15;
    CCP1CON = 0b00001111;
    CCPR1L  = 8;
    T2CON   = 0b00000100;
    TRISIO  &= 0b11111011;

    /* init GP0 GP1 as digital pins*/
    ANSELbits.ANS0 = 0;
    ANSELbits.ANS1 = 0;
    CMCON0bits.CM = 0x07; // cmp off
    TRISIO &= 0b11111101; // GP1 as output

    /* init GP5 as digital pin */
    ANSELbits.ANS3 = 0;

    /* init pullups */
    OPTION_REGbits.nGPPU = 0;
    
    /* init GP4 pullup */
    WPUbits.WPU4 = 1;

    /* set TMR1 */
    T1CONbits.TMR1CS = 1; // clk from t1cki pin
    TMR1H = 0xFF;
    TMR1L = 0x00;
    T1CONbits.TMR1ON = 1;

    /* Enable interrupts */
    PIR1bits.TMR1IF = 0;
    PIE1bits.TMR1IE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.GIE = 1;
}

