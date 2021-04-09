message(STATUS "Windows: Detected C compiler: ${CMAKE_C_COMPILER_ID} ${CMAKE_C_COMPILER}")

add_compile_options(/MP /W4 /nologo /MD)
add_definitions(-DWIN32_LEAN_AND_MEAN)
add_definitions(-DLUA_BUILD_AS_DLL)
set(LUA_LIBLUA_NAME "lua${PROJECT_VERSION_MAJOR}${PROJECT_VERSION_MINOR}")
set(CPACK_SYSTEM_NAME "Windows")
set(CPACK_GENERATOR "ZIP")
