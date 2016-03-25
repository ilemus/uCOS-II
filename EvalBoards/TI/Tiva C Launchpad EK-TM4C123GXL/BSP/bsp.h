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
* Filename      : bsp.h
* Version       : V1.00
* Programmer(s) : FF
*********************************************************************************************************
*/

#ifndef  BSP_H_
#define  BSP_H_


/*
*********************************************************************************************************
*                                               DEFINES
*********************************************************************************************************
*/

//SAR Mod
#define  BSP_GPIO_PORTA                                        0x40004000
#define  BSP_GPIO_PORTB                                        0x40005000
#define  BSP_GPIO_PORTC                                        0x40006000
#define  BSP_GPIO_PORTD                                        0x40007000
#define  BSP_GPIO_PORTE                                        0x40024000
#define  BSP_GPIO_PORTF                                        0x40025000


/*
*********************************************************************************************************
*                                             REGISTERS
*********************************************************************************************************
*/

//SAR Defines
#define  BSP_GPIO_REG_DATA(port_nbr)              (*(CPU_REG32 *)((port_nbr) + 0x03FCu))
#define  BSP_GPIO_REG_DIR(port_nbr)               (*(CPU_REG32 *)((port_nbr) + 0x0400u))
#define  BSP_GPIO_REG_DEN(port_nbr)               (*(CPU_REG32 *)((port_nbr) + 0x051Cu))


/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/

void  BSP_Init (void);

#endif
