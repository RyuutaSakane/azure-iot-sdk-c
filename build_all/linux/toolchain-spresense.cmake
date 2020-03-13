INCLUDE(CMakeForceCompiler)
#macro(/home/ryuskn/work/src/github/private/spresense/sdk/.config)

SET(CMAKE_HOST_SYSTEM_NAME Linux)  # Name of the OS CMake is running on. 
SET(CMAKE_SYSTEM_NAME Generic)     # The CMake-identifier of the target platform to build for.
SET(CMAKE_SYSTEM_PROCESSOR arm)    # The CMake-identifier of the target architecture to build for.
SET(CMAKE_SYSTEM_VERSION 1)        # this one not so much

# this is the location of the amd64 toolchain targeting the Raspberry Pi
SET(CMAKE_C_COMPILER arm-none-eabi-gcc)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

option(use_builtin_httpapi "set use_builtin_httpapi to ON to use the built-in httpapi_compact that comes with C shared utility (default is OFF)" ON)
option(use_default_uuid "set use_default_uuid to ON to use the out of the box UUID that comes with the SDK rather than platform specific implementations" ON)
option(use_openssl "set use_openssl to ON to use OpenSSL." OFF)
option(use_mbedtls "set use_mbedtls to ON to use mbedtls." ON)
option(skip_samples "set skip_samples to ON to skip building samples (default is OFF)[if possible, they are always build]" ON)

#SET(CMAKE_FIND_ROOT_PATH /home/ryuskn/work/src/github/private/spresense)

# search for programs in the build host directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(spresense-root "/home/ryuskn/work/src/github/private/spresense-v2.0")
set(spresense-sdk "${spresense-root}/sdk")
set(spresense-nuttx "${spresense-sdk}/../nuttx")
set(spresense-externals "${spresense-sdk}/../externals")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-builtin -mabi=aapcs -Wno-type-limits -Os -fno-strict-aliasing -fno-strength-reduce -fomit-frame-pointer -mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard -I. -isystem ${spresense-nuttx}/include  -D__KERNEL__ -pipe -gdwarf-3 -isystem ${spresense-sdk}/bsp/include -isystem ${spresense-sdk}/modules/include -I${spresense-nuttx}/sched -I${spresense-externals}/mbedtls/include -I${spresense-nuttx}/arch/arm/src/chip -I${spresense-nuttx}/arch/arm/src/common -I${spresense-nuttx}/arch/arm/src/armv7-m -I${spresense-sdk}/bsp/src" CACHE STRING "")

set(CMAKE_EXE_LINKER_FLAGS "--specs=nosys.specs" CACHE INTERNAL "")

