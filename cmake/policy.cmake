cmake_policy(SET CMP0025 NEW) # Compiler id for Apple Clang is now AppleClang
cmake_policy(SET CMP0005 NEW) # Preprocessor definition values are now escaped automatically.
if(POLICY CMP0053)
  cmake_policy(SET CMP0053 NEW) # faster evaluation of variable references
endif()
if(POLICY CMP0054)
  cmake_policy(SET CMP0054 NEW) # Only interpret if() arguments as variables or keywords when unquoted
endif()
if (POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW) # project() command manages VERSION variables.
endif()
