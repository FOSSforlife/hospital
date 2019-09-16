#!/usr/bin/sh
#
# Script file to compile all C++ source files in or under the
# current directory.  This has been used in the cygwin and OpenSUSE
# environment the GCC and Clang compilers and linkers

# Find and display all the c++ source files to be compiled ...
# temporarily ignore spaces when globing words into file names
temp=$IFS
  IFS=$'\n'
  directories=( $(find ./ -mindepth 1 -maxdepth 1  -type d) ) # create array of source files
IFS=$temp

BuildTool="/home/thomas/Desktop/C++ Development Root/Build.sh"

echo "compiling ..."
for dirName in "${directories[@]}"; do
  echo "  $dirName"
  (cd "$dirName"/;  "$BuildTool" > compile.log 2>&1   &&   "./project_(clang++).exe" > program_test.log 2>&1)
done
echo ""
