################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
drivers/buttons.obj: ../drivers/buttons.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="drivers/buttons.d_raw" --obj_directory="drivers" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/configADC.obj: ../drivers/configADC.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="drivers/configADC.d_raw" --obj_directory="drivers" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

drivers/rgb.obj: ../drivers/rgb.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="drivers/rgb.d_raw" --obj_directory="drivers" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


