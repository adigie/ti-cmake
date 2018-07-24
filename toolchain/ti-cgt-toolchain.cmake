cmake_minimum_required(VERSION 3.6)

if(NOT DEFINED ENV{TI_CGT_PATH})
    message(FATAL_ERROR "TI_CGT_PATH environment variable is not defined!")
endif()

if(NOT DEFINED SYSTEM_MAKE)
    find_program(SYSTEM_MAKE make)
    if(SYSTEM_MAKE)
        message(STATUS "Using system make")
    else()
        message(STATUS "Using gmake")
        if(DEFINED ENV{CCS_UTILS_DIR})
            set(CMAKE_MAKE_PROGRAM_INIT $ENV{CCS_UTILS_DIR}/bin/gmake)
        else()
            message(FATAL_ERROR "CCS_UTILS_DIR environment variable is not defined")
        endif()
    endif()
endif()

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER   $ENV{TI_CGT_PATH}/bin/armcl)
set(CMAKE_CXX_COMPILER $ENV{TI_CGT_PATH}/bin/armcl)
set(CMAKE_ASM_COMPILER $ENV{TI_CGT_PATH}/bin/armasm)

set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES   $ENV{TI_CGT_PATH}/include)
set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES $ENV{TI_CGT_PATH}/include)

set(CMAKE_EXE_LINKER_FLAGS_INIT "--rom_model --reread_libs --issue_remarks --stack_size=512 --heap_size=0 -I$ENV{TI_CGT_PATH}/include -I$ENV{TI_CGT_PATH}/lib")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
