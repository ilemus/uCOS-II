//*****************************************************************************
//
// olimex_led.c - Simple olimex_led world example.
//
// Copyright (c) 2012-2013 Texas Instruments Incorporated.  All rights reserved.
// Software License Agreement
// 
// Texas Instruments (TI) is supplying this software for use solely and
// exclusively on TI's microcontroller products. The software is owned by
// TI and/or its suppliers, and is protected under applicable copyright
// laws. You may not combine this software with "viral" open-source
// software in order to form a larger program.
// 
// THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
// NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
// NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
// CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
// DAMAGES, FOR ANY REASON WHATSOEVER.
// 
// This is part of revision 1.1 of the EK-TM4C123GXL Firmware Package.
//
//*****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/systick.h"
#include "driverlib/uart.h"
#include "utils/softssi.h"
#include "utils/uartstdio.h"

//*****************************************************************************
//
//! \addtogroup example_list
//! <h1>olimex_led World (olimex_led)</h1>
//!
//! A very simple "hello world" example.  It simply displays "Hello World!"
//! on the UART and is a starting point for more complicated applications.
//!
//! UART0, connected to the Virtual Serial Port and running at 115,200, 8-N-1,
//! is used to display messages from this application.
//! 
//! Displays a series of faces on the LED matrix.
//
//*****************************************************************************


//*****************************************************************************
//
// The error routine that is called if the driver library encounters an error.
//
//*****************************************************************************
#ifdef DEBUG
void
__error__(char *pcFilename, uint32_t ui32Line)
{
}
#endif

//*****************************************************************************
//
// Number of bytes to send and receive.
//
//*****************************************************************************
#define NUM_SSI_DATA            8

//*****************************************************************************
//
// The persistent state of the SoftSSI peripheral.
//
//*****************************************************************************
tSoftSSI g_sSoftSSI;

//*****************************************************************************
//
// The data buffer that is used as the transmit FIFO.  The size of this buffer
// can be increased or decreased as required to match the transmit buffering
// requirements of your application.
//
//*****************************************************************************
uint16_t g_pui16TxBuffer[16];

//*****************************************************************************
//
// The data buffer that is used as the receive FIFO.  The size of this buffer
// can be increased or decreased as required to match the receive buffering
// requirements of your application.
//
//*****************************************************************************
uint16_t g_pui16RxBuffer[16];

//*****************************************************************************
//
// Index control variable to cycle through faces.
//
//*****************************************************************************
volatile uint32_t g_ui32FaceIndex;

//*****************************************************************************
//
// Matrices that correspond to faces on the LED display.
//
//*****************************************************************************
#define NONE    0
#define LAUGH   1
#define HAPPY   2
#define SMILE   3
#define ANGRY   4
#define NUM_FACES 5

const uint8_t g_ui8Faces[NUM_FACES][8] = 
                    {   
                    {0x03, 0x03, 0x40, 0x4E, 0x4E, 0x40, 0x03, 0x03},
                    {0x43, 0xC3, 0xC0, 0xCE, 0xCE, 0xC0, 0xC3, 0x43},    
                    {0x66, 0x86, 0x80, 0x9C, 0x9C, 0x80, 0x86, 0x66},    
                    {0x46, 0x86, 0x80, 0x9C, 0x9C, 0x80, 0x86, 0x46},    
                    {0x86, 0x46, 0x40, 0x5C, 0x5C, 0x40, 0x46, 0x86}
                    };  

//*****************************************************************************
//
// Bit-wise reverses a number.
//
//*****************************************************************************
uint8_t
Reverse(uint8_t ui8Number)
{
    uint16_t ui8Index;
    uint16_t ui8ReversedNumber = 0;
    for(ui8Index=0; ui8Index<8; ui8Index++)
    {
        ui8ReversedNumber = ui8ReversedNumber << 1;
        ui8ReversedNumber |= ((1 << ui8Index) & ui8Number) >> ui8Index;
    }
    return ui8ReversedNumber;
}

//*****************************************************************************
//
// The interrupt handler for the SysTick interrupt.
//
//*****************************************************************************
void
SysTickIntHandler(void)
{
    static uint32_t ui32TickCounter;
    //
    // Call the SoftSSI timer tick.
    //
    SoftSSITimerTick(&g_sSoftSSI);
    
    //
    // Keep track of ticks and scroll through the faces in the array
    // 
    ui32TickCounter++;
    if(ui32TickCounter > 10000)
    {
        ui32TickCounter = 0;
        g_ui32FaceIndex++;
        if(g_ui32FaceIndex >= NUM_FACES)
        {
            g_ui32FaceIndex = 0;
        }
    }
}

//*****************************************************************************
//
// Print a graphic on the 8x8 LED screen.
// 
//*****************************************************************************
void
PrintByteArray(const uint8_t * pui8Bytes)
{
    uint32_t ui32Index; 
    uint32_t ui32Data;
    
    //
    // Display indication that the SoftSSI is transmitting data.
    //
    UARTprintf("\n\nSent:\n  ");

    //
    // Send the 8 bytes of data.
    //
    for(ui32Index = 0; ui32Index < NUM_SSI_DATA; ui32Index++)
    {
        ui32Data = (Reverse(pui8Bytes[ui32Index]) << 8) + (1 << ui32Index);
        
        //
        // Display the data that SSI is transferring.
        //
        UARTprintf("'%x' ", ui32Data);
        
        //
        // Send the data using the "blocking" put function.  This function
        // will wait until there is room in the send FIFO before returning.
        // This allows you to assure that all the data you send makes it
        // into the send FIFO.
        //
        SoftSSIDataPut(&g_sSoftSSI, ui32Data);

        //
        // Wait until SoftSSI is done transferring all the data in the 
        // transmit FIFO.
        //
        while(SoftSSIBusy(&g_sSoftSSI))
        {
        }
        
        //
        // Raise the clear signal to show the new value.
        //
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, GPIO_PIN_5);
        SysCtlDelay(100);
        //
        // Clear the Shift Register
        //
        GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0);
        
    }
}

//*****************************************************************************
//
// Configure the UART and its pins.  This must be called before UARTprintf().
//
//*****************************************************************************
void
ConfigureUART(void)
{
    //
    // Enable the GPIO Peripheral used by the UART.
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

    //
    // Enable UART0
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);

    //
    // Configure GPIO Pins for UART mode.
    //
    ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
    ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
    ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

    //
    // Use the internal 16MHz oscillator as the UART clock source.
    //
    UARTClockSourceSet(UART0_BASE, UART_CLOCK_PIOSC);

    //
    // Initialize the UART for console I/O.
    //
    UARTStdioConfig(0, 115200, 16000000);
}

//*****************************************************************************
//
// Print "Hello World!" to the UART on the evaluation board.
//
//*****************************************************************************
int
main(void)
{
    
    // Enable lazy stacking for interrupt handlers.  This allows floating-point
    // instructions to be used within interrupt handlers, but at the expense of
    // extra stack usage.
    //
    ROM_FPUEnable();
    ROM_FPULazyStackingEnable();

    //
    // Set the clocking to run directly from the crystal.
    //
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_5 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ |
                       SYSCTL_OSC_MAIN);

    //
    // Initialize the UART.
    //
    ConfigureUART();

    //
    // Hello!
    //
    UARTprintf("Hello, world!\n");

    //
    // Initialize the GPIOs we will need for communication with the LED Matrix
    //
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    
    //
    // Initialize the clear signal
    //
    ROM_GPIOPinTypeGPIOOutput(GPIO_PORTE_BASE, GPIO_PIN_5);
    ROM_GPIOPinWrite(GPIO_PORTE_BASE, GPIO_PIN_5, 0);

    //
    // Configure the SoftSSI module.  The size of the FIFO buffers can be
    // changed to accommodate the requirements of your application.  The GPIO
    // pins utilized can also be changed.
    // The pins are assigned as follows:
    //      PB4 - SoftSSICLK
    //      PB6 - SoftSSITx
    //
    memset(&g_sSoftSSI, 0, sizeof(g_sSoftSSI));
    SoftSSIClkGPIOSet(&g_sSoftSSI, GPIO_PORTB_BASE, GPIO_PIN_4);
    SoftSSITxGPIOSet(&g_sSoftSSI, GPIO_PORTB_BASE, GPIO_PIN_6);
    SoftSSIRxBufferSet(&g_sSoftSSI, g_pui16RxBuffer,
                       sizeof(g_pui16RxBuffer) / sizeof(g_pui16RxBuffer[0]));
    SoftSSITxBufferSet(&g_sSoftSSI, g_pui16TxBuffer,
                       sizeof(g_pui16TxBuffer) / sizeof(g_pui16TxBuffer[0]));

    //
    // Configure the SoftSSI module.  Use idle clock level low and active low
    // clock (mode 0) and 8-bit data.  You can set the polarity of the SoftSSI
    // clock when the SoftSSI module is idle.  You can also configure what
    // clock edge you want to capture data on.  Please reference the datasheet
    // for more information on the different SPI modes.
    //
    SoftSSIConfigSet(&g_sSoftSSI, SOFTSSI_FRF_MOTO_MODE_0, 16);

    //
    // Enable the SoftSSI module.
    //
    SoftSSIEnable(&g_sSoftSSI);

    //
    // Configure SysTick to provide an interrupt at a 10 KHz rate.  This is
    // used to control the clock rate of the SoftSSI module; the clock rate of
    // the SoftSSI Clk signal will be 1/2 the interrupt rate.
    //
    SysTickPeriodSet(SysCtlClockGet() / 20000);
    SysTickIntEnable();
    SysTickEnable();

  while(1)
    {
        //
        // Cycle through all available faces...
        // Face index updated inside the SysTickIntHandler.
        //
        PrintByteArray(g_ui8Faces[g_ui32FaceIndex]);
        
    }

}
