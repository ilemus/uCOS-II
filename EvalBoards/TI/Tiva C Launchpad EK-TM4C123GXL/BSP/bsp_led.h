/*
*********************************************************************************************************
*                                            EXAMPLE CODE
*
*               This file is provided as an example on how to use Micrium products.
*
*               Please feel free to use any application code labeled as 'EXAMPLE CODE' in
*               your application products.  Example code may be used as is, in whole or in
*               part, or may be used as a reference only. This file can be modified as
*               required to meet the end-product requirements.
*
*               Please help us continue to provide the Embedded community with the finest
*               software available.  Your honesty is greatly appreciated.
*
*               You can find our product's user manual, API reference, release notes and
*               more information at https://doc.micrium.com.
*               You can contact us at www.micrium.com.
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                         BOARD SUPPORT PACKAGE
*
*                                      Texas Instruments TM4C129x
*                                                on the
*                                             DK-TM4C129X
*                                           Development Kit
*       		Modified by Dr. Samir A. Rawashdeh, for the TM4C123GH6PM microcontroller on the 
*						TM4C123G Tiva C Series Launchpad (TM4C123GXL), November 2014.
*
* Filename      : bsp_led.h
* Version       : V1.00
* Programmer(s) : FF
*********************************************************************************************************
*/

#ifndef  BSP_LED_H_
#define  BSP_LED_H_

/*
*********************************************************************************************************
*                                              CONSTANTS
*********************************************************************************************************
*/

#define  BSP_LED_TRICOLOR_GREEN               DEF_BIT_03   //SAR Edit
#define  BSP_LED_TRICOLOR_BLUE                DEF_BIT_02   //SAR Edit
#define  BSP_LED_TRICOLOR_RED	                DEF_BIT_01   //SAR Addition


#define  BSP_SW1							                DEF_BIT_04   //SAR Addition
#define  BSP_SW2	            						    DEF_BIT_00   //SAR Addition


/*$PAGE*/
/*
*********************************************************************************************************
*                                            PROTOTYPES
*********************************************************************************************************
*/

void    BSP_LED_Init    (void);
void    BSP_LED_On      (CPU_INT08U  led);
void    BSP_LED_Off     (CPU_INT08U  led);
void    BSP_LED_Toggle  (CPU_INT08U  led);

#endif
