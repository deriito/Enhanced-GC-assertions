cmake_minimum_required(VERSION 3.23)
project(enhanced-gc-assertions C)

set(CMAKE_C_STANDARD 99)

add_executable(enhanced-gc-assertions siod.c slib.c sliba.c trace.c)