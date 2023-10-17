################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
utils/RunTimeStatsConfig.obj: ../utils/RunTimeStatsConfig.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="utils/RunTimeStatsConfig.d_raw" --obj_directory="utils" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/cmdline.obj: ../utils/cmdline.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="utils/cmdline.d_raw" --obj_directory="utils" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/cpu_usage.obj: ../utils/cpu_usage.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="utils/cpu_usage.d_raw" --obj_directory="utils" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

utils/uartstdio.obj: ../utils/uartstdio.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 -me --include_path="D:/Post-Graduation/Embedded Systems/EUI Internship/Technical/projects/EUI_EME_ARM12_FREERTOS_BLINKY/EUI_EME_ARM12_FREERTOS_BLINKY" --include_path="C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.4.LTS/include" --define=ccs="ccs" --define=PART_TM4C123GH6PM -g --gcc --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --preproc_with_compile --preproc_dependency="utils/uartstdio.d_raw" --obj_directory="utils" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


