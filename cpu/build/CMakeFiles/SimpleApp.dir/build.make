# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/dinusha/miniconda3/lib/python3.12/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/dinusha/miniconda3/lib/python3.12/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/dinusha/simple_executorch

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dinusha/simple_executorch/build

# Include any dependencies generated for this target.
include CMakeFiles/SimpleApp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/SimpleApp.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/SimpleApp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SimpleApp.dir/flags.make

CMakeFiles/SimpleApp.dir/codegen:
.PHONY : CMakeFiles/SimpleApp.dir/codegen

CMakeFiles/SimpleApp.dir/src/main.cpp.o: CMakeFiles/SimpleApp.dir/flags.make
CMakeFiles/SimpleApp.dir/src/main.cpp.o: /home/dinusha/simple_executorch/src/main.cpp
CMakeFiles/SimpleApp.dir/src/main.cpp.o: CMakeFiles/SimpleApp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/dinusha/simple_executorch/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SimpleApp.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SimpleApp.dir/src/main.cpp.o -MF CMakeFiles/SimpleApp.dir/src/main.cpp.o.d -o CMakeFiles/SimpleApp.dir/src/main.cpp.o -c /home/dinusha/simple_executorch/src/main.cpp

CMakeFiles/SimpleApp.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/SimpleApp.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dinusha/simple_executorch/src/main.cpp > CMakeFiles/SimpleApp.dir/src/main.cpp.i

CMakeFiles/SimpleApp.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/SimpleApp.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dinusha/simple_executorch/src/main.cpp -o CMakeFiles/SimpleApp.dir/src/main.cpp.s

# Object files for target SimpleApp
SimpleApp_OBJECTS = \
"CMakeFiles/SimpleApp.dir/src/main.cpp.o"

# External object files for target SimpleApp
SimpleApp_EXTERNAL_OBJECTS =

SimpleApp: CMakeFiles/SimpleApp.dir/src/main.cpp.o
SimpleApp: CMakeFiles/SimpleApp.dir/build.make
SimpleApp: /usr/local/lib/libexecutorch.a
SimpleApp: /usr/local/lib/libextension_module_static.a
SimpleApp: /usr/local/lib/libexecutorch_no_prim_ops.a
SimpleApp: /usr/local/lib/libextension_data_loader.a
SimpleApp: /usr/local/lib/libextension_tensor.a
SimpleApp: /usr/local/lib/libportable_ops_lib.a
SimpleApp: /usr/local/lib/libportable_kernels.a
SimpleApp: CMakeFiles/SimpleApp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/dinusha/simple_executorch/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable SimpleApp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SimpleApp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SimpleApp.dir/build: SimpleApp
.PHONY : CMakeFiles/SimpleApp.dir/build

CMakeFiles/SimpleApp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SimpleApp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SimpleApp.dir/clean

CMakeFiles/SimpleApp.dir/depend:
	cd /home/dinusha/simple_executorch/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dinusha/simple_executorch /home/dinusha/simple_executorch /home/dinusha/simple_executorch/build /home/dinusha/simple_executorch/build /home/dinusha/simple_executorch/build/CMakeFiles/SimpleApp.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/SimpleApp.dir/depend

