#!/usr/bin/env bash
BuildTaskName="$1"

clear
echo -e "$BuildTaskName\n"  # Build Title

# Find and display all the c++ source files to be compiled ...
# temporarily ignore spaces when globing words into file names
temp=$IFS
  IFS=$'\n'
  sourceFiles=( $(find ./ -name "*.cpp") )
IFS=$temp

echo "compiling ..."
for fileName in "${sourceFiles[@]}"; do
  echo "  $fileName"
done
echo ""


# Set some options and perform the compolations ...
GccOptions="  -Wall -Wextra -pedantic        \
              -Wdelete-non-virtual-dtor      \
              -Wduplicated-branches          \
              -Wduplicated-cond              \
              -Wextra-semi                   \
              -Wfloat-equal                  \
              -Winit-self                    \
              -Wlogical-op                   \
              -Wnoexcept                     \
              -Wnon-virtual-dtor             \
              -Wold-style-cast               \
              -Wstrict-null-sentinel         \
              -Wsuggest-override             \
              -Wswitch-default               \
              -Wswitch-enum                  \
              -Woverloaded-virtual           \
              -Wuseless-cast                 \
              -Wzero-as-null-pointer-constant"

ClangOptions=" -stdlib=libc++ -Weverything    \
               -Wno-sign-conversion           \
               -Wno-exit-time-destructors     \
               -Wno-global-constructors       \
               -Wno-missing-prototypes        \
               -Wno-weak-vtables              \
               -Wno-padded                    \
               -Wno-double-promotion          \
               -Wno-c++98-compat-pedantic     \
               -Wno-c++11-compat-pedantic     \
               -Wno-c++14-compat-pedantic     \
               -Wno-c++17-compat-pedantic     \
               -fdiagnostics-show-category=name"

CommonOptions="-pthread -std=c++17 -I./ -DUSING_TOMS_SUGGESTIONS -D__func__=__PRETTY_FUNCTION__"

if [ $Compiler = 'clang++' ]
then
  options="$Options $CommonOptions $ClangOptions"
elif [ $Compiler = 'g++' ]
then
  options="$Options $CommonOptions $GccOptions"
fi

echo $Compiler $options
$Compiler --version
$Compiler $options -o "$Executable" "${sourceFiles[@]}" && echo -e "\nSuccessfully created  \"$Executable\""
