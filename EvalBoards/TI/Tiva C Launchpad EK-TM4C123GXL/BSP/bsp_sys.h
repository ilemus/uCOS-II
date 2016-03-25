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
* Filename      : bsp_sys.h
* Version       : V1.00
* Programmer(s) : FF
*********************************************************************************************************
*/

#include  <cpu.h>

/*
*********************************************************************************************************
*                                               DEFINES
*********************************************************************************************************
*/

#define 	SYSDIV2 													4u

/*
*********************************************************************************************************
*                                             REGISTERS
*********************************************************************************************************
*/

#define  BSP_SYS_BASE_ADDR                            0x400FE000u
#define  BSP_SYS_REG_RCGCGPIO                     (*(CPU_REG32 *)(BSP_SYS_BASE_ADDR + 0x0608u))


/*
*********************************************************************************************************
*                                            REGISTER BITS
*********************************************************************************************************
*/

#define  BSP_RCGCGPIO_PORT_F                           DEF_BIT_05
#define  BSP_RCGCGPIO_PORT_E                           DEF_BIT_04
#define  BSP_RCGCGPIO_PORT_D                           DEF_BIT_03
#define  BSP_RCGCGPIO_PORT_C                           DEF_BIT_02
#define  BSP_RCGCGPIO_PORT_B                           DEF_BIT_01
#define  BSP_RCGCGPIO_PORT_A                           DEF_BIT_00


/*
*********************************************************************************************************
*                                         FUNCTION PROTOTYPES
*********************************************************************************************************
*/

void        BSP_SysInit      (void);
CPU_INT32U  BSP_SysClkFreqGet(void);
