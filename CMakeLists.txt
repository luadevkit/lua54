cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(lua VERSION 5.4.2)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
  message(FATAL_ERROR "Not allowed to run in-source build!")
endif()

include(cmake/policy.cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/macros")
include(CheckPlatform)

message(STATUS "Building Lua ${lua_VERSION}")

add_subdirectory(src)

if(${CMAKE_HOST_SYSTEM_PROCESSOR} STREQUAL "x86_64")
  set(CPACK_SYSTEM_NAME "${CPACK_SYSTEM_NAME}-amd64")
else()
  set(CPACK_SYSTEM_NAME "${CPACK_SYSTEM_NAME}-${CMAKE_HOST_SYSTEM_PROCESSOR}")
endif()
string(TOLOWER "${CPACK_SYSTEM_NAME}" CPACK_SYSTEM_NAME)

set(CPACK_TOPLEVEL_TAG lua)
set(CPACK_PACKAGE_CHECKSUM SHA256)
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY OFF)
set(CPACK_PACKAGE_DIRECTORY "${CMAKE_SOURCE_DIR}/artifacts")
include(CPack)

