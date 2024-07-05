cmake_minimum_required(VERSION 3.20.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
project(flags_test LANGUAGES C ASM)
add_executable(flags_test main.c test.S)
