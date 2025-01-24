# cmake_minimum_required(VERSION 3.16)
# set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/toolchain.cmake)

# project(test_project C CXX ASM)
# set(CMAKE_C_STANDARD 11)
# set(CMAKE_CXX_STANDARD 17)


################################################################################################################


# Copyright 2023-2024 Arm Limited and/or its affiliates.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

cmake_minimum_required(VERSION 3.20)
project(arm_simple_app)

# set(LIBS_DIR "${CMAKE_SOURCE_DIR}/../libs/arm")

# Selects timing adapter values matching system_config.
# Default is Ethos_U55_High_End_Embedded, simulating optimal hardware for the Corestone-300.
set(SYSTEM_CONFIG "Ethos_U55_High_End_Embedded" CACHE STRING "System config")

# Dependencies from the Ethos-U Core This is the platform target of
# Corstone-300, that includes ethosu_core_driver and bare-metal bringup
# libraries. We link against ethosu_target_init which includes all of these
# dependencies.
# if(SYSTEM_CONFIG STREQUAL "Ethos_U55_High_End_Embedded")
  add_subdirectory(/workspace/executorch/examples/arm/ethos-u-scratch/ethos-u/core_platform/targets/corstone-300 target)
  set(TARGET_BOARD "corstone-300")
  target_compile_definitions(ethosu_target_common INTERFACE
      # ETHOSU_MODEL=0 place pte file/data in SRAM area
      # ETHOSU_MODEL=1 place pte file/data in DDR area
      ETHOSU_MODEL=1
      # Configure NPU architecture timing adapters
      # This is just example numbers and you should make this match your hardware
      # SRAM
      ETHOSU_TA_MAXR_0=8
      ETHOSU_TA_MAXW_0=8
      ETHOSU_TA_MAXRW_0=0
      ETHOSU_TA_RLATENCY_0=32
      ETHOSU_TA_WLATENCY_0=32
      ETHOSU_TA_PULSE_ON_0=3999
      ETHOSU_TA_PULSE_OFF_0=1
      ETHOSU_TA_BWCAP_0=4000
      ETHOSU_TA_PERFCTRL_0=0
      ETHOSU_TA_PERFCNT_0=0
      ETHOSU_TA_MODE_0=1
      ETHOSU_TA_HISTBIN_0=0
      ETHOSU_TA_HISTCNT_0=0
      # Flash
      ETHOSU_TA_MAXR_1=2
      ETHOSU_TA_MAXW_1=0
      ETHOSU_TA_MAXRW_1=0
      ETHOSU_TA_RLATENCY_1=64
      ETHOSU_TA_WLATENCY_1=0
      ETHOSU_TA_PULSE_ON_1=320
      ETHOSU_TA_PULSE_OFF_1=80
      ETHOSU_TA_BWCAP_1=50
      ETHOSU_TA_PERFCTRL_1=0
      ETHOSU_TA_PERFCNT_1=0
      ETHOSU_TA_MODE_1=1
      ETHOSU_TA_HISTBIN_1=0
      ETHOSU_TA_HISTCNT_1=0
      )


# The arm_simple_app executable
add_executable(arm_simple_app)

target_sources(
  arm_simple_app PRIVATE 
  src/main.cpp
)

# Include the target's bare-metal linker script
ethosu_eval_link_options(arm_simple_app)



set(arm_executor_runner_link)
list(APPEND arm_executor_runner_link

  ethosu_target_init
  -Xlinker -Map=arm_simple_app.map
)

# Need whole-archive to ensure C++ ctor's are called - this may be wasteful for
# bin size as we link in a number of other symbols
target_link_libraries(arm_simple_app
  m
  /workspace/boot-camp-2025/DSP-session/build/bin_dsp/libCMSISDSP.a
  ${arm_executor_runner_link}
)

target_link_options( arm_simple_app PUBLIC LINKER:-Map=arm_simple_app.map )

target_include_directories(arm_simple_app PRIVATE
    /workspace/boot-camp-2025/DSP-session/CMSIS-DSP/Include
    # /workspace/boot-camp-2025/DSP-session/CMSIS_5/CMSIS/Core/Include
)





