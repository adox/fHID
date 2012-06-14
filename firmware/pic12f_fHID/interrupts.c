/******************************************************************************/
/*Files to Include                                                            */
/******************************************************************************/

#include <htc.h>            /* HiTech General Includes */
#include <stdint.h>         /* For uint8_t definition */
#include <stdbool.h>        /* For true/false definition */
#include "interrupts.h"

/******************************************************************************/
/* Interrupt Routines                                                         */
/******************************************************************************/

void interrupt isr(void)
{
    /* This code stub shows general interrupt handling.  Note that these
    conditional statements are not handled within 3 seperate if blocks.
    Do not use a seperate if block for each interrupt flag to avoid run
    time errors. */

#if 1

    /* TODO Add High Priority interrupt routine code here. */

    /* Determine which flag generated the interrupt */
    if(PIE1bits.TMR2IE && PIR1bits.TMR2IF) {

        switch(divider) {
            case 0:
                if(GPIObits.GP4) {
                    PR2 = 159;
                    divider = 4;
                } else {
                    PR2 = 127;
                    divider = 5;
                }

                GPIObits.GP5 = 1;

                if(tagIndex >= 96)
                    tagIndex = 0;

                break;

            case 1:
                CCPR1L = (GPIObits.GP4 ? 80 : 64);
                GPIObits.GP5 = 0;
            default:
                divider--;
        }


        PIR1bits.TMR2IF = 0;

    } else {
        /* Unhandled interrupts */
    }

#endif

};
