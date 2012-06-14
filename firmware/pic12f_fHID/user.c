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

    /* init GP0 GP1 as digital pins*/
    ANSELbits.ANS0 = 0;
    ANSELbits.ANS1 = 0;
    CMCON0bits.CM = 0x07; // cmp off


    /* init GP5 as digital pin */
    ANSELbits.ANS3 = 0;

    /* GP0 as inputs, all inputs in fact */
    TRISIO  = 0b11111111;

    /* init pullups */
    OPTION_REGbits.nGPPU = 0;
    
    /* init GP4 pullup */
    WPUbits.WPU4 = 1;

    /* if READ, GP0 = R/E = 1 */
    /* init CCP1 125 kHz 50% DT */

    if(GPIObits.GP0) {
        PR2     = 15;
        CCP1CON = 0b00001111;
        CCPR1L  = 8;
        T2CONbits.TMR2ON = 1;
        TRISIO  &= 0b11111011;

    } else {

        /* if EMULATE, GP0 = R/E = 0 */
        TRISIO &= 0b11011011; // GP2, GP5 as output

        /* set CCP 1 */
        divider = 5;
        PR2     = 127;
        CCPR1L  = 64;
        CCP1CON = 0b00001111;
        T2CONbits.TMR2ON = 1;

        /* Enable interrupts */

        PIR1bits.TMR2IF = 0;
        PIE1bits.TMR2IE = 1;
        INTCONbits.PEIE = 1;
        INTCONbits.GIE = 1;

    };
}

