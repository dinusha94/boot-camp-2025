
# cmake_minimum_required (VERSION 3.30)


# set(CMSISDSP /home/CV/CMSIS-DSP)
# set(CMSISCORE /home/CV/CMSIS_5/CMSIS/Core)

# # set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-#warning")
# # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-#warning")

# # set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-error")
# # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error")

# # Define the project
# project (cmsis-dsp VERSION 0.1)

# add_subdirectory(${CMSISDSP}/Source bin_dsp)

# target_compile_options(CMSISDSP PUBLIC 
#     -Wsign-compare
#     -Wdouble-promotion
#     -Ofast -ffast-math
#     -DNDEBUG
#     -Wall -Wextra  -Werror
#     -fshort-enums 
#     -flax-vector-conversions
#     #-fshort-wchar
# )

cmake_minimum_required(VERSION 3.16)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/toolchain.cmake)

set(HOME $ENV{HOME})
set(CMSISDSP ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS-DSP)
set(CMSISCORE ${CMAKE_CURRENT_SOURCE_DIR}/CMSIS_5/CMSIS/Core)

add_compile_options(
    -mcpu=cortex-m4
    -std=gnu11
    -ffunction-sections
    -fdata-sections
    #--specs=nano.specs
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    -mthumb
    
    -Wsign-compare
    -Wdouble-promotion
    -Ofast -ffast-math
    -DNDEBUG
    -Wall -Wextra  -Werror
    -fshort-enums 
    #-fshort-wchar
    )
add_link_options(
    -mfloat-abi=hard    
    -mcpu=cortex-m4
    -Wl,--gc-sections
    -static
    -mfpu=fpv4-sp-d16
    -mthumb
    )
## Define the project
project (cmsis-dsp)

add_subdirectory(${CMSISDSP}/Source bin_dsp)