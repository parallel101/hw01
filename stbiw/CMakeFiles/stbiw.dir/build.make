# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/liangqx/hw01

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liangqx/hw01

# Include any dependencies generated for this target.
include stbiw/CMakeFiles/stbiw.dir/depend.make

# Include the progress variables for this target.
include stbiw/CMakeFiles/stbiw.dir/progress.make

# Include the compile flags for this target's objects.
include stbiw/CMakeFiles/stbiw.dir/flags.make

stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.o: stbiw/CMakeFiles/stbiw.dir/flags.make
stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.o: stbiw/stb_image_write.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liangqx/hw01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.o"
	cd /home/liangqx/hw01/stbiw && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/stbiw.dir/stb_image_write.cpp.o -c /home/liangqx/hw01/stbiw/stb_image_write.cpp

stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stbiw.dir/stb_image_write.cpp.i"
	cd /home/liangqx/hw01/stbiw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liangqx/hw01/stbiw/stb_image_write.cpp > CMakeFiles/stbiw.dir/stb_image_write.cpp.i

stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stbiw.dir/stb_image_write.cpp.s"
	cd /home/liangqx/hw01/stbiw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liangqx/hw01/stbiw/stb_image_write.cpp -o CMakeFiles/stbiw.dir/stb_image_write.cpp.s

# Object files for target stbiw
stbiw_OBJECTS = \
"CMakeFiles/stbiw.dir/stb_image_write.cpp.o"

# External object files for target stbiw
stbiw_EXTERNAL_OBJECTS =

stbiw/libstbiw.a: stbiw/CMakeFiles/stbiw.dir/stb_image_write.cpp.o
stbiw/libstbiw.a: stbiw/CMakeFiles/stbiw.dir/build.make
stbiw/libstbiw.a: stbiw/CMakeFiles/stbiw.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liangqx/hw01/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libstbiw.a"
	cd /home/liangqx/hw01/stbiw && $(CMAKE_COMMAND) -P CMakeFiles/stbiw.dir/cmake_clean_target.cmake
	cd /home/liangqx/hw01/stbiw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stbiw.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
stbiw/CMakeFiles/stbiw.dir/build: stbiw/libstbiw.a

.PHONY : stbiw/CMakeFiles/stbiw.dir/build

stbiw/CMakeFiles/stbiw.dir/clean:
	cd /home/liangqx/hw01/stbiw && $(CMAKE_COMMAND) -P CMakeFiles/stbiw.dir/cmake_clean.cmake
.PHONY : stbiw/CMakeFiles/stbiw.dir/clean

stbiw/CMakeFiles/stbiw.dir/depend:
	cd /home/liangqx/hw01 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liangqx/hw01 /home/liangqx/hw01/stbiw /home/liangqx/hw01 /home/liangqx/hw01/stbiw /home/liangqx/hw01/stbiw/CMakeFiles/stbiw.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : stbiw/CMakeFiles/stbiw.dir/depend

