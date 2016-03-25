;
;********************************************************************************************************
;                                    EXCEPTION VECTORS & STARTUP CODE
;
; File      : cstartup.s
; For       : Cortex-M4
; Mode      : Thumb2
; Toolchain : RealView Development Suite
;             RealView Microcontroller Development Kit (MDK)
;             ARM Developer Suite (ADS)
;             Keil uVision
;********************************************************************************************************
;

;/*
;********************************************************************************************************
;*                           <<< Use Configuration Wizard in Context Menu >>>
;*
;* Note(s) : (1) The µVision4 Configuration Wizard enables menu driven configuration of assembler,
;*               C/C++, or debugger initialization files. The Configuration Wizard uses control items
;*               that are embedded into the comments of the configuration file.
;*
;********************************************************************************************************
;*/

;/*
;********************************************************************************************************
;*                                              STACK DEFINITIONS
;*
;* Configuration Wizard Menu:
;* // <h> Stack Configuration
;* //   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
;* // </h>;
;*********************************************************************************************************
;*/

Stack_Size      EQU     0x00000200

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


;/*
;********************************************************************************************************
;*                                               HEAP DEFINITIONS
; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>
;*********************************************************************************************************
;*/

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


                                                                ; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size
                
                IMPORT  BSP_IntHandlerGPIOA
                IMPORT  BSP_IntHandlerGPIOB
                IMPORT  BSP_IntHandlerGPIOC
                IMPORT  BSP_IntHandlerGPIOD
                IMPORT  BSP_IntHandlerGPIOE
                IMPORT  BSP_IntHandlerUART0
                IMPORT  BSP_IntHandlerUART1
                IMPORT  BSP_IntHandlerSSI0
                IMPORT  BSP_IntHandlerI2C0
                IMPORT  BSP_IntHandlerPWM_FAULT
                IMPORT  BSP_IntHandlerPWM_GEN0
                IMPORT  BSP_IntHandlerPWM_GEN1
                IMPORT  BSP_IntHandlerPWM_GEN2
                IMPORT  BSP_IntHandlerQEI0
                IMPORT  BSP_IntHandlerADC0_0
                IMPORT  BSP_IntHandlerADC0_1
                IMPORT  BSP_IntHandlerADC0_2
                IMPORT  BSP_IntHandlerADC0_3
                IMPORT  BSP_IntHandlerWDTO_WDT1
                IMPORT  BSP_IntHandlerTMR0A
                IMPORT  BSP_IntHandlerTMR0B
                IMPORT  BSP_IntHandlerTMR1A
                IMPORT  BSP_IntHandlerTMR1B
                IMPORT  BSP_IntHandlerTMR2A
                IMPORT  BSP_IntHandlerTMR2B
                IMPORT  BSP_IntHandlerACOMP0
                IMPORT  BSP_IntHandlerACOMP1
                IMPORT  BSP_IntHandlerACOMP2
                IMPORT  BSP_IntHandlerSYS_CTRL
                IMPORT  BSP_IntHandlerFLASH
                IMPORT  BSP_IntHandlerGPIOF
                IMPORT  BSP_IntHandlerGPIOG
                IMPORT  BSP_IntHandlerGPIOH
                IMPORT  BSP_IntHandlerUART2
                IMPORT  BSP_IntHandlerSSI1
                IMPORT  BSP_IntHandlerTMR3A
                IMPORT  BSP_IntHandlerTMR3B
                IMPORT  BSP_IntHandlerI2C1
                IMPORT  BSP_IntHandlerCAN0
                IMPORT  BSP_IntHandlerCAN1
                IMPORT  BSP_IntHandlerETHER_MAC
                IMPORT  BSP_IntHandlerHIB
                IMPORT  BSP_IntHandlerUSB_MAC
                IMPORT  BSP_IntHandlerPWM_GEN3
                IMPORT  BSP_IntHandlerUDMA0_SOFT
                IMPORT  BSP_IntHandlerUDAM0_ERR
                IMPORT  BSP_IntHandlerADC1_0
                IMPORT  BSP_IntHandlerADC1_1
                IMPORT  BSP_IntHandlerADC1_2
                IMPORT  BSP_IntHandlerADC1_3
                IMPORT  BSP_IntHandlerEPI0
                IMPORT  BSP_IntHandlerGPIOJ
                IMPORT  BSP_IntHandlerGPIOK
                IMPORT  BSP_IntHandlerGPIOL
                IMPORT  BSP_IntHandlerSSI2
                IMPORT  BSP_IntHandlerSSI3
                IMPORT  BSP_IntHandlerUART3
                IMPORT  BSP_IntHandlerUART4
                IMPORT  BSP_IntHandlerUART5
                IMPORT  BSP_IntHandlerUART6
                IMPORT  BSP_IntHandlerUART7
                IMPORT  BSP_IntHandlerI2C2
                IMPORT  BSP_IntHandlerI2C3
                IMPORT  BSP_IntHandlerTMR4A
                IMPORT  BSP_IntHandlerTMR4B
                IMPORT  BSP_IntHandlerTMR5A
                IMPORT  BSP_IntHandlerTMR5B
                IMPORT  BSP_IntHandlerFP
                IMPORT  BSP_IntHandlerRSVD68
                IMPORT  BSP_IntHandlerRSVD69
                IMPORT  BSP_IntHandlerI2C4
                IMPORT  BSP_IntHandlerI2C5
                IMPORT  BSP_IntHandlerGPIOM
                IMPORT  BSP_IntHandlerGPION
                IMPORT  BSP_IntHandlerRSVD74
                IMPORT  BSP_IntHandlerTAMPER
                IMPORT  BSP_IntHandlerGPIOP0
                IMPORT  BSP_IntHandlerGPIOP1
                IMPORT  BSP_IntHandlerGPIOP2
                IMPORT  BSP_IntHandlerGPIOP3
                IMPORT  BSP_IntHandlerGPIOP4
                IMPORT  BSP_IntHandlerGPIOP5
                IMPORT  BSP_IntHandlerGPIOP6
                IMPORT  BSP_IntHandlerGPIOP7
                IMPORT  BSP_IntHandlerGPIOQ0
                IMPORT  BSP_IntHandlerGPIOQ1
                IMPORT  BSP_IntHandlerGPIOQ2
                IMPORT  BSP_IntHandlerGPIOQ3
                IMPORT  BSP_IntHandlerGPIOQ4
                IMPORT  BSP_IntHandlerGPIOQ5
                IMPORT  BSP_IntHandlerGPIOQ6
                IMPORT  BSP_IntHandlerGPIOQ7
                IMPORT  BSP_IntHandlerGPIOR
                IMPORT  BSP_IntHandlerGPIOS
                IMPORT  BSP_IntHandlerSHA_MD5
                IMPORT  BSP_IntHandlerAES
                IMPORT  BSP_IntHandlerDES
                IMPORT  BSP_IntHandlerLCD
                IMPORT  BSP_IntHandlerTMR6A
                IMPORT  BSP_IntHandlerTMR6B
                IMPORT  BSP_IntHandlerTMR7A
                IMPORT  BSP_IntHandlerTMR7B
                IMPORT  BSP_IntHandlerI2C6
                IMPORT  BSP_IntHandlerI2C7
                IMPORT  BSP_IntHandlerRSVD104
                IMPORT  BSP_IntHandler1WIRE
                IMPORT  BSP_IntHandlerRSVD106
                IMPORT  BSP_IntHandlerRSVD107
                IMPORT  BSP_IntHandlerRSVD108
                IMPORT  BSP_IntHandlerI2C8
                IMPORT  BSP_IntHandlerI2C9
                IMPORT  BSP_IntHandlerGPIOT
    
                IMPORT  OS_CPU_PendSVHandler
                IMPORT  OS_CPU_SysTickHandler

__Vectors       DCD     __initial_sp                            ;   0 Top of Stack
                DCD     Reset_Handler                           ;   1 Reset Handler
                DCD     App_NMI_ISR                             ;   2 NMI Handler
                DCD     App_Fault_ISR                           ;   3 Hard Fault Handler
                DCD     App_MemFault_ISR                        ;   4 MPU Fault Handler
                DCD     App_BusFault_ISR                        ;   5 Bus Fault Handler
                DCD     App_UsageFault_ISR                      ;   6 Usage Fault Handler
                DCD     App_Spurious_ISR                        ;   7 Reserved
                DCD     App_Spurious_ISR                        ;   8 Reserved
                DCD     App_Spurious_ISR                        ;   9 Reserved
                DCD     App_Spurious_ISR                        ;  10 Reserved
                DCD     App_Spurious_ISR                        ;  11 SVCall Handler
                DCD     App_Spurious_ISR                        ;  12 Debug Monitor Handler
                DCD     App_Spurious_ISR                        ;  13 Reserved
                DCD     OS_CPU_PendSVHandler                    ;  14 PendSV Handler
                DCD     OS_CPU_SysTickHandler                   ;  15 SysTick Handler

                                                                ; External Interrupts

                DCD     BSP_IntHandlerGPIOA                     ;  16, INTISR[  0]  GPIO Port A.
                DCD     BSP_IntHandlerGPIOB                     ;  17, INTISR[  1]  GPIO Port B.
                DCD     BSP_IntHandlerGPIOC                     ;  18, INTISR[  2]  GPIO Port C.
                DCD     BSP_IntHandlerGPIOD                     ;  19, INTISR[  3]  GPIO Port D.
                DCD     BSP_IntHandlerGPIOE                     ;  20, INTISR[  4]  GPIO Port E.
                DCD     BSP_IntHandlerUART0                     ;  21, INTISR[  5]  UART0.
                DCD     BSP_IntHandlerUART1                     ;  22, INTISR[  6]  UART1.
                DCD     BSP_IntHandlerSSI0                      ;  23, INTISR[  7]  SSI0.
                DCD     BSP_IntHandlerI2C0                      ;  24, INTISR[  8]  I2C0.
                DCD     BSP_IntHandlerPWM_FAULT                 ;  25, INTISR[  9]  PWM Fault.
                DCD     BSP_IntHandlerPWM_GEN0                  ;  26, INTISR[ 10]  PWM Generator 0.
                DCD     BSP_IntHandlerPWM_GEN1                  ;  27, INTISR[ 11]  PWM Generator 1.
                DCD     BSP_IntHandlerPWM_GEN2                  ;  28, INTISR[ 12]  PWM Generator 2.
                DCD     BSP_IntHandlerQEI0                      ;  29, INTISR[ 13]  QEI0.
                DCD     BSP_IntHandlerADC0_0                    ;  30, INTISR[ 14]  ADC0 Sequence 0.
                DCD     BSP_IntHandlerADC0_1                    ;  31, INTISR[ 15]  ADC0 Sequence 1.
                DCD     BSP_IntHandlerADC0_2                    ;  32, INTISR[ 16]  ADC0 Sequence 2.
                DCD     BSP_IntHandlerADC0_3                    ;  33, INTISR[ 17]  ADC0 Sequence 3.
                DCD     BSP_IntHandlerWDTO_WDT1                 ;  34, INTISR[ 18]  Watchdog Timers 0 and 1.
                DCD     BSP_IntHandlerTMR0A                     ;  35, INTISR[ 19]  16/32-Bit Timer 0A.
                DCD     BSP_IntHandlerTMR0B                     ;  36, INTISR[ 20]  16/32-Bit Timer 0B.
                DCD     BSP_IntHandlerTMR1A                     ;  37, INTISR[ 21]  16/32-Bit Timer 1A.
                DCD     BSP_IntHandlerTMR1B                     ;  38, INTISR[ 22]  16/32-Bit Timer 1B.
                DCD     BSP_IntHandlerTMR2A                     ;  39, INTISR[ 23]  16/32-Bit Timer 2A.
                DCD     BSP_IntHandlerTMR2B                     ;  40, INTISR[ 24]  16/32-Bit Timer 2B.
                DCD     BSP_IntHandlerACOMP0                    ;  41, INTISR[ 25]  Analog Comparator 0.
                DCD     BSP_IntHandlerACOMP1                    ;  42, INTISR[ 26]  Analog Comparator 1.
                DCD     BSP_IntHandlerACOMP2                    ;  43, INTISR[ 27]  Analog Comparator 2.
                DCD     BSP_IntHandlerSYS_CTRL                  ;  44, INTISR[ 28]  System Control.
                DCD     BSP_IntHandlerFLASH                     ;  45, INTISR[ 29]  Flash Memory Control.
                DCD     BSP_IntHandlerGPIOF                     ;  46, INTISR[ 30]  GPIO Port F.
                DCD     BSP_IntHandlerGPIOG                     ;  47, INTISR[ 31]  GPIO Port G.
                DCD     BSP_IntHandlerGPIOH                     ;  48, INTISR[ 32]  GPIO Port H.
                DCD     BSP_IntHandlerUART2                     ;  49, INTISR[ 33]  UART2.
                DCD     BSP_IntHandlerSSI1                      ;  50, INTISR[ 34]  SSI1.
                DCD     BSP_IntHandlerTMR3A                     ;  51, INTISR[ 35]  16/32-Bit Timer 3A.
                DCD     BSP_IntHandlerTMR3B                     ;  52, INTISR[ 36]  16/32-Bit Timer 3B.
                DCD     BSP_IntHandlerI2C1                      ;  53, INTISR[ 37]  I2C1.
                DCD     BSP_IntHandlerCAN0                      ;  54, INTISR[ 38]  CAN0.
                DCD     BSP_IntHandlerCAN1                      ;  55, INTISR[ 39]  CAN1.
                DCD     BSP_IntHandlerETHER_MAC                 ;  56, INTISR[ 40]  Ethernet MAC.
                DCD     BSP_IntHandlerHIB                       ;  57, INTISR[ 41]  HIB(Power Island).
                DCD     BSP_IntHandlerUSB_MAC                   ;  58, INTISR[ 42]  USB MAC.
                DCD     BSP_IntHandlerPWM_GEN3                  ;  59, INTISR[ 43]  PWM Generator 3.
                DCD     BSP_IntHandlerUDMA0_SOFT                ;  60, INTISR[ 44]  uDMA 0 Software.
                DCD     BSP_IntHandlerUDAM0_ERR                 ;  61, INTISR[ 45]  uDMA 0 Error.
                DCD     BSP_IntHandlerADC1_0                    ;  62, INTISR[ 46]  ADC1 Sequence 0.
                DCD     BSP_IntHandlerADC1_1                    ;  63, INTISR[ 47]  ADC1 Sequence 1.
                DCD     BSP_IntHandlerADC1_2                    ;  64, INTISR[ 48]  ADC1 Sequence 2.
                DCD     BSP_IntHandlerADC1_3                    ;  65, INTISR[ 49]  ADC1 Sequence 3.
                DCD     BSP_IntHandlerEPI0                      ;  66, INTISR[ 50]  EPI0.
                DCD     BSP_IntHandlerGPIOJ                     ;  67, INTISR[ 51]  GPIO Port J.
                DCD     BSP_IntHandlerGPIOK                     ;  68, INTISR[ 52]  GPIO Port K.
                DCD     BSP_IntHandlerGPIOL                     ;  69, INTISR[ 53]  GPIO Port L.
                DCD     BSP_IntHandlerSSI2                      ;  70, INTISR[ 54]  SSI2.
                DCD     BSP_IntHandlerSSI3                      ;  71, INTISR[ 55]  SSI3.
                DCD     BSP_IntHandlerUART3                     ;  72, INTISR[ 56]  UART3.
                DCD     BSP_IntHandlerUART4                     ;  73, INTISR[ 57]  UART4.
                DCD     BSP_IntHandlerUART5                     ;  74, INTISR[ 58]  UART5.
                DCD     BSP_IntHandlerUART6                     ;  75, INTISR[ 59]  UART6.
                DCD     BSP_IntHandlerUART7                     ;  76, INTISR[ 60]  UART7.
                DCD     BSP_IntHandlerI2C2                      ;  77, INTISR[ 61]  I2C 2.
                DCD     BSP_IntHandlerI2C3                      ;  78, INTISR[ 62]  I2C 3.
                DCD     BSP_IntHandlerTMR4A                     ;  79, INTISR[ 63]  Timer 4A.
                DCD     BSP_IntHandlerTMR4B                     ;  80, INTISR[ 64]  Timer 4B.
                DCD     BSP_IntHandlerTMR5A                     ;  81, INTISR[ 65]  Timer 5A.
                DCD     BSP_IntHandlerTMR5B                     ;  82, INTISR[ 66]  Timer 5B.
                DCD     BSP_IntHandlerFP                        ;  83, INTISR[ 67]  FP Exception(imprecise).

                DCD     BSP_IntHandlerRSVD68                    ;  84, INTISR[ 68]  Reserved.
                DCD     BSP_IntHandlerRSVD69                    ;  85, INTISR[ 69]  Reserved.

                DCD     BSP_IntHandlerI2C4                      ;  86, INTISR[ 70]  I2C 4.
                DCD     BSP_IntHandlerI2C5                      ;  87, INTISR[ 71]  I2C 5.
                DCD     BSP_IntHandlerGPIOM                     ;  88, INTISR[ 72]  GPIO Port M.
                DCD     BSP_IntHandlerGPION                     ;  89, INTISR[ 73]  GPIO Port N.

                DCD     BSP_IntHandlerRSVD74                    ;  90, INTISR[ 74]  Reserved.

                DCD     BSP_IntHandlerTAMPER                    ;  91, INTISR[ 75]  Tamper.
                DCD     BSP_IntHandlerGPIOP0                    ;  92, INTISR[ 76]  GPIO Port P(Summary or P0).
                DCD     BSP_IntHandlerGPIOP1                    ;  93, INTISR[ 77]  GPIO Port P1.
                DCD     BSP_IntHandlerGPIOP2                    ;  94, INTISR[ 78]  GPIO Port P2.
                DCD     BSP_IntHandlerGPIOP3                    ;  95, INTISR[ 79]  GPIO Port P3.
                DCD     BSP_IntHandlerGPIOP4                    ;  96, INTISR[ 80]  GPIO Port P4.
                DCD     BSP_IntHandlerGPIOP5                    ;  97, INTISR[ 81]  GPIO Port P5.
                DCD     BSP_IntHandlerGPIOP6                    ;  98, INTISR[ 82]  GPIO Port P6.
                DCD     BSP_IntHandlerGPIOP7                    ;  99, INTISR[ 83]  GPIO Port P7.
                DCD     BSP_IntHandlerGPIOQ0                    ; 100, INTISR[ 84]  GPIO Port Q(Summary or Q0).
                DCD     BSP_IntHandlerGPIOQ1                    ; 101, INTISR[ 85]  GPIO Port Q1.
                DCD     BSP_IntHandlerGPIOQ2                    ; 102, INTISR[ 86]  GPIO Port Q2.
                DCD     BSP_IntHandlerGPIOQ3                    ; 103, INTISR[ 87]  GPIO Port Q3.
                DCD     BSP_IntHandlerGPIOQ4                    ; 104, INTISR[ 88]  GPIO Port Q4.
                DCD     BSP_IntHandlerGPIOQ5                    ; 105, INTISR[ 89]  GPIO Port Q5.
                DCD     BSP_IntHandlerGPIOQ6                    ; 106, INTISR[ 90]  GPIO Port Q6.
                DCD     BSP_IntHandlerGPIOQ7                    ; 107, INTISR[ 91]  GPIO Port Q7.
                DCD     BSP_IntHandlerGPIOR                     ; 108, INTISR[ 92]  GPIO Port R.
                DCD     BSP_IntHandlerGPIOS                     ; 109, INTISR[ 93]  GPIO Port S.
                DCD     BSP_IntHandlerSHA_MD5                   ; 110, INTISR[ 94]  SHA/MD5.
                DCD     BSP_IntHandlerAES                       ; 111, INTISR[ 95]  AES.
                DCD     BSP_IntHandlerDES                       ; 112, INTISR[ 96]  DES.
                DCD     BSP_IntHandlerLCD                       ; 113, INTISR[ 97]  LCD.
                DCD     BSP_IntHandlerTMR6A                     ; 114, INTISR[ 98]  16/32-Bit Timer 6A.
                DCD     BSP_IntHandlerTMR6B                     ; 115, INTISR[ 99]  16/32-Bit Timer 6B.
                DCD     BSP_IntHandlerTMR7A                     ; 116, INTISR[100]  16/32-Bit Timer 7A.
                DCD     BSP_IntHandlerTMR7B                     ; 117, INTISR[101]  16/32-Bit Timer 7B.
                DCD     BSP_IntHandlerI2C6                      ; 118, INTISR[102]  I2C 6.
                DCD     BSP_IntHandlerI2C7                      ; 119, INTISR[103]  I2C 7.

                DCD     BSP_IntHandlerRSVD104                   ; 120, INTISR[104]  Reserved.

                DCD     BSP_IntHandler1WIRE                     ; 121, INTISR[105]  1-Wire.

                DCD     BSP_IntHandlerRSVD106                   ; 122, INTISR[106]  Reserved.
                DCD     BSP_IntHandlerRSVD107                   ; 123, INTISR[107]  Reserved.
                DCD     BSP_IntHandlerRSVD108                   ; 124, INTISR[108]  Reserved.

                DCD     BSP_IntHandlerI2C8                      ; 125, INTISR[109]  I2C 8.
                DCD     BSP_IntHandlerI2C9                      ; 126, INTISR[110]  I2C 9.
                DCD     BSP_IntHandlerGPIOT                     ; 127, INTISR[111]  GPIO T.

__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  __main
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

App_NMI_ISR     PROC
                EXPORT  App_NMI_ISR               [WEAK]
                B       .
                ENDP
App_Fault_ISR\
                PROC
                EXPORT  App_Fault_ISR             [WEAK]
                B       .
                ENDP
App_MemFault_ISR\
                PROC
                EXPORT  App_MemFault_ISR          [WEAK]
                B       .
                ENDP
App_BusFault_ISR\
                PROC
                EXPORT  App_BusFault_ISR          [WEAK]
                B       .
                ENDP
App_UsageFault_ISR\
                PROC
                EXPORT  App_UsageFault_ISR        [WEAK]
                B       .
                ENDP
App_Spurious_ISR\
                PROC
                EXPORT  App_Spurious_ISR          [WEAK]
                B       .
                ENDP
App_Reserved_ISR\
                PROC
                EXPORT  App_Reserved_ISR          [WEAK]
                B       .
                ENDP

                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, = (Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, =  Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
