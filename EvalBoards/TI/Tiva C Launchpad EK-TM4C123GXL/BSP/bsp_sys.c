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
* Filename      : bsp_sys.c
* Version       : V1.00
* Programmer(s) : FF
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                             INCLUDES
*********************************************************************************************************
*/

#include  "bsp_cfg.h"
#include  "..\..\..\..\..\uc-lib\lib_def.h"
#include  "..\bsp\bsp_sys.h"

////SAR Addition
#include <stdbool.h>
#include <stdint.h>
#include "driverlib/sysctl.h"

/*$PAGE*/
/*
*********************************************************************************************************
*                                         BSP SYSTEM INITIALIZATION
*
* Description: This function should be called early in the BSP initialization process.
*
* Argument(s): none.
*
* Return(s)  : none.
*
* Caller(s)  : Application.
*
*********************************************************************************************************
*/


void  BSP_SysInit (void)  //SAR: modified to use TI library, to set clock to 80 MHz.
{
	
    SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN |
                   SYSCTL_XTAL_16MHZ);
	
}


/*
*********************************************************************************************************
*                                         SYSTEM CLOCK FREQUENCY
*
* Description: This function is used to retrieve system or CPU clock frequency.
*
* Arguments  : None
*
* Return     : System clock frequency in cycles.
*
* Caller(s)  : Application.
*
* Note(s)    : None
*********************************************************************************************************
*/

CPU_INT32U  BSP_SysClkFreqGet (void) //SAR: modified to use TI library call.
{
	
		return SysCtlClockGet(); 
	
}
