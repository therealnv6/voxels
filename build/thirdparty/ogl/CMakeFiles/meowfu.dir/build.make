# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/riven/projects/voxel-ogl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/riven/projects/voxel-ogl/build

# Include any dependencies generated for this target.
include thirdparty/ogl/CMakeFiles/meowfu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.make

# Include the progress variables for this target.
include thirdparty/ogl/CMakeFiles/meowfu.dir/progress.make

# Include the compile flags for this target's objects.
include thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_glfw.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_glfw.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_glfw.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_glfw.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_opengl3.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_opengl3.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_opengl3.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/backends/imgui_impl_opengl3.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_draw.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_draw.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_draw.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_draw.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_demo.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_demo.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_demo.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_demo.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_tables.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_tables.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_tables.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_tables.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_widgets.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o -MF CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o.d -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_widgets.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_widgets.cpp > CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/thirdparty/imgui/imgui_widgets.cpp -o CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.s

thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/flags.make
thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o: /home/riven/projects/voxel-ogl/thirdparty/ogl/src/render.cpp
thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o: thirdparty/ogl/CMakeFiles/meowfu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o -MF CMakeFiles/meowfu.dir/src/render.cpp.o.d -o CMakeFiles/meowfu.dir/src/render.cpp.o -c /home/riven/projects/voxel-ogl/thirdparty/ogl/src/render.cpp

thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/meowfu.dir/src/render.cpp.i"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/riven/projects/voxel-ogl/thirdparty/ogl/src/render.cpp > CMakeFiles/meowfu.dir/src/render.cpp.i

thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/meowfu.dir/src/render.cpp.s"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/riven/projects/voxel-ogl/thirdparty/ogl/src/render.cpp -o CMakeFiles/meowfu.dir/src/render.cpp.s

# Object files for target meowfu
meowfu_OBJECTS = \
"CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o" \
"CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o" \
"CMakeFiles/meowfu.dir/src/render.cpp.o"

# External object files for target meowfu
meowfu_EXTERNAL_OBJECTS =

thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_glfw.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/backends/imgui_impl_opengl3.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_draw.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_demo.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_tables.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/thirdparty/imgui/imgui_widgets.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/src/render.cpp.o
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/build.make
thirdparty/ogl/libmeowfu.a: thirdparty/ogl/CMakeFiles/meowfu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/riven/projects/voxel-ogl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Linking CXX static library libmeowfu.a"
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && $(CMAKE_COMMAND) -P CMakeFiles/meowfu.dir/cmake_clean_target.cmake
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/meowfu.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
thirdparty/ogl/CMakeFiles/meowfu.dir/build: thirdparty/ogl/libmeowfu.a
.PHONY : thirdparty/ogl/CMakeFiles/meowfu.dir/build

thirdparty/ogl/CMakeFiles/meowfu.dir/clean:
	cd /home/riven/projects/voxel-ogl/build/thirdparty/ogl && $(CMAKE_COMMAND) -P CMakeFiles/meowfu.dir/cmake_clean.cmake
.PHONY : thirdparty/ogl/CMakeFiles/meowfu.dir/clean

thirdparty/ogl/CMakeFiles/meowfu.dir/depend:
	cd /home/riven/projects/voxel-ogl/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/riven/projects/voxel-ogl /home/riven/projects/voxel-ogl/thirdparty/ogl /home/riven/projects/voxel-ogl/build /home/riven/projects/voxel-ogl/build/thirdparty/ogl /home/riven/projects/voxel-ogl/build/thirdparty/ogl/CMakeFiles/meowfu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : thirdparty/ogl/CMakeFiles/meowfu.dir/depend

