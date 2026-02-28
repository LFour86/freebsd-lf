set -gx PATH /usr/local/llvm22/bin /usr/local/gcc-arm-embedded-14.2.rel1/bin $PATH
set -gx C_INCLUDE_PATH /usr/local/include $C_INCLUDE_PATH
set -gx CPLUS_INCLUDE_PATH /usr/local/include $CPLUS_INCLUDE_PATH
set -gx LIBRARY_PATH /usr/local/lib $LIBRARY_PATH

if status is-interactive
# Commands to run in interactive sessions can go here
end
