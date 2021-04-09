message(STATUS "UNIX: Detected C compiler: ${CMAKE_C_COMPILER_ID} ${CMAKE_C_COMPILER}")

list(APPEND CMAKE_C_FLAGS -fPIC)
list(APPEND LUA_EXTERNAL_LIBS m)

if(APPLE)
  add_definitions(-DLUA_USE_MACOSX)
else()
  add_definitions(-DLUA_USE_LINUX)

  find_package(LibDL REQUIRED)
  include_directories(${LIBDL_INCLUDE_DIR})
  list(APPEND LUA_EXTERNAL_LIBS ${LIBDL_LIBRARIES})
endif()

set(LUA_LIBLUA_NAME "lua")
set(CPACK_GENERATOR "TGZ")
set(CPACK_SYSTEM_NAME "${CMAKE_HOST_SYSTEM_NAME}")
