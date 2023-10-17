/********************
 *
 * - FreeRTOS starting example with Tiva C Series TM4C123GH6PM
 * - GitHub: AndresCasasola
 *
 ********************/

#include <stdbool.h>
#include <stdint.h>
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "inc/hw_ints.h"
#include "driverlib/gpio.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "utils/uartstdio.h"
#include "drivers/buttons.h"
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "semphr.h"
#include "utils/cpu_usage.h"
#include "drivers/rgb.h"

// Global variables
uint32_t g_ui32CPUUsage;
uint32_t g_ulSystemClock; // System clock speed

// Routine functions (RTI)
void ButtonHandler(void);

// The error routine that is called if the driver library or freeRTOS encounters an error.
#ifdef DEBUG
void __error__(char *nombrefich, uint32_t linea){
    while(1);
}
#endif

/********** Events links for FreeRTOS **********/

// Stack overflow detected
void vApplicationStackOverflowHook(xTaskHandle *pxTask, signed char *pcTaskName){
    while(1);
}

// CPU monitoring every system tick
void vApplicationTickHook( void ){
    static uint8_t count = 0;
    if (++count == 10){
        g_ui32CPUUsage = CPUUsageTick();
        count = 0;
    }
}

// Executes when Idle task runs
void vApplicationIdleHook (void){
    SysCtlSleep();
}
// Executes when Idle task runs
void vApplicationMallocFailedHook (void){
    while(1);
}

void system_config(){
    /******************** System Configuration ********************/
    // Set clock to 40 MHz (200 MHz from PLL with divider of 5)
    ROM_SysCtlClockSet(SYSCTL_SYSDIV_5 | SYSCTL_USE_PLL | SYSCTL_XTAL_16MHZ | SYSCTL_OSC_MAIN);	//

    // Get the system clock speed
    g_ulSystemClock = SysCtlClockGet();

    // Enables clock gating of peripherals in low power
    // Enable peripherals in sleep mode with SysCtlPeripheralSleepEnable()
    ROM_SysCtlPeripheralClockGating(true);

    // CPU usage measure subsystem (It measures the time that CPU is awake. It uses timer 3)
    CPUUsageInit(g_ulSystemClock, configTICK_RATE_HZ/10, 3);

    // UART initialization and configuration
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
    ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
    ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
    ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);
    UARTStdioConfig(0, 115200, SysCtlClockGet());

    // Enables UART and GPIOA even if CPU is in sleep mode
    ROM_SysCtlPeripheralSleepEnable(SYSCTL_PERIPH_UART0);
    ROM_SysCtlPeripheralSleepEnable(SYSCTL_PERIPH_GPIOA);

    // Buttons and interruptions configuration
    ButtonsInit();
    IntRegister(INT_GPIOF, ButtonHandler);
    GPIOIntTypeSet(GPIO_PORTF_BASE, GPIO_PIN_4|GPIO_PIN_0, GPIO_BOTH_EDGES);
    IntPrioritySet(INT_GPIOF, configMAX_SYSCALL_INTERRUPT_PRIORITY);

    // Initialize LEDs through RGB library. It uses Timers 0 y 1
    RGBInit(1);
    SysCtlPeripheralSleepEnable(GREEN_TIMER_PERIPH);
    SysCtlPeripheralSleepEnable(BLUE_TIMER_PERIPH);
    SysCtlPeripheralSleepEnable(RED_TIMER_PERIPH);	// BLUE_TIMER_PERIPH y GREEN_TIMER_PERIPH are the same

    // Configure LEDs in GPIO mode
    ROM_GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3);
    /******************** System Configuration ********************/
}

/**Tasks Declarations.**/

void vTask1( void *pvParameters );
void vTask2( void *pvParameters );

// Main function
void main(void)
{

    system_config();
    //Initialize clock for PORTF
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    //Initialize PINS 1,2,3 as output pins.
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1 |GPIO_PIN_2 | GPIO_PIN_3);
    // Little Test
    //    GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1|GPIO_PIN_2, 255);
    //    UARTprintf("Hello. UART is working! \n");


    // Tasks Creation

    /* Create one of the two tasks. Note that a real application should check
    the return value of the xTaskCreate() call to ensure the task was created
    successfully. */
    xTaskCreate( vTask1, /* Pointer to the function that implements the task. */
                 "Task 1",/* Text name for the task. This is to facilitate debugging only. */
                 100, /* Stack depth in words. */
                 NULL, /* We are not using the task parameter. */
                 1, /* This task will run at priority 1. */
                 NULL ); /* We are not going to use the task handle. */


    /* Create the other task in exactly the same way and at the same priority. */
    xTaskCreate( vTask2, "Task 2", 240, NULL, 1, NULL );

    // Tasks Start

    vTaskStartScheduler();	// Start scheduler, RTOS enables interruptions here.

    while(1){} // Something was wrong if the program executes this loop (with scheduler started).
}

/********** RTIs **********/

void ButtonHandler(void){
    // Empty
}

void vTask1( void *pvParameters )
{
    //    const char *pcTaskName = "Task 1 is running\n";
    volatile unsigned long ul;
    /* As per most tasks, this task is implemented in an infinite loop. */
    for( ;; )
    {
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
        /*Turn the Red LED on.*/
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0x02);
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
        /*Turn the Green LED off.*/
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0x00);
        /* Delay for a period. */
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
    }
}

void vTask2( void *pvParameters )
{
    //    const char *pcTaskName = "Task 2 is running\n";
    volatile unsigned long ul;
    /* As per most tasks, this task is implemented in an infinite loop. */
    for( ;; )
    {
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
        /*Turn the Green LED on.*/
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0x08);
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
        /*Turn the Red LED off.*/
        GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0x00);
        /* Delay for a period. */
        vTaskDelay((TickType_t) 1000/portTICK_RATE_MS);
    }
}

