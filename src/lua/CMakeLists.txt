include(GenerateExportHeader)

set(_HEADERS
  lua.h luaconf.h lualib.h lauxlib.h lua.hpp)

set(_SRCS
  lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c
  lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c lundump.c
  lvm.c lzio.c
  lauxlib.c lbaselib.c lcorolib.c ldblib.c liolib.c lmathlib.c loadlib.c
  loslib.c lstrlib.c ltablib.c lutf8lib.c linit.c
  ${_HEADERS})

install(
  FILES ${_HEADERS}
  DESTINATION "include")

add_library(liblua SHARED ${_SRCS})
generate_export_header(liblua)
set_target_properties(liblua PROPERTIES OUTPUT_NAME "${LUA_LIBLUA_NAME}")
set_target_properties(liblua PROPERTIES VERSION "${lua_VERSION}")
set_target_properties(liblua PROPERTIES SOVERSION "${lua_VERSION}")

if(APPLE)
  set(CMAKE_INSTALL_RPATH "@executable_path/../lib")
elseif(UNIX)
  set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")
endif()

install(
  TARGETS liblua
  RUNTIME DESTINATION "bin"
  LIBRARY DESTINATION "lib"
  ARCHIVE DESTINATION "lib")

add_executable(lua lua.c)
set_target_properties(lua PROPERTIES ENABLE_EXPORTS true)
target_link_libraries(lua liblua ${LUA_EXTERNAL_LIBS})
install(
  TARGETS lua
  RUNTIME DESTINATION "bin")
