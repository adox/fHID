/******************************************************************************/
/* User Level #define Macros                                                  */
/******************************************************************************/

/* TODO Application specific user parameters used in user.c may go here */
extern uint8_t divider;
extern const uint8_t tagData1[];
extern const uint8_t tagData2[];
extern const uint8_t tagData3[];
extern const uint8_t tagData4[];
extern uint8_t *tagData;

/******************************************************************************/
/* User Function Prototypes                                                   */
/******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */

void InitApp(void);         /* I/O and Peripheral Initialization */
