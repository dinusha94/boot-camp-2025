cmake_minimum_required(VERSION 3.10)

project(HelloWorld)

# Specify the ARM toolchain for Cortex-M55
set(CMAKE_TOOLCHAIN_FILE /home/dinusha/executorch/examples/arm/ethos-u-setup/arm-none-eabi-gcc.cake)

# Set the target CPU
set(TARGET_CPU cortex-m55)

# Add your source files
add_executable(hello_world hello.c)

# Link libraries as needed
target_link_libraries(hello_world m)
