/******************************************************************************/
/*Files to Include                                                            */
/******************************************************************************/

#include <htc.h>            /* HiTech General Includes */
#include <stdint.h>         /* For uint8_t definition */
#include <stdbool.h>        /* For true/false definition */

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
    if(PIE1bits.TMR1IE && PIR1bits.TMR1IF) {
        TMR1L = (GPIObits.GP4 ? 0xFF - 2 : 0xFF - 1);
        TMR1H = 0xFF;

        GPIObits.GP1 = ~GPIObits.GP1;

        PIR1bits.TMR1IF = 0;

    } else {
        /* Unhandled interrupts */
    }

#endif

}
