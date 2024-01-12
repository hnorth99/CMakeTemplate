# Enable coverage on a target
function(EnableCoverage target)
  if(CMAKE_BUILD_TYPE STREQUAL Debug)
    target_compile_options(${target} PRIVATE -fprofile-instr-generate
                                             -fcoverage-mapping -fno-inline)
    target_link_options(${target} PUBLIC -fprofile-instr-generate
                        -fcoverage-mapping)
  endif()
endfunction()

# Clear the coverage data collected for a target
function(CleanCoverage target)
  add_custom_command(
    TARGET ${target}
    PRE_BUILD
    COMMAND find ${CMAKE_BINARY_DIR} -type f -name '*.profraw' -exec rm {} +)
endfunction()

# Add coverage onto a target
function(AddCoverage target)
  if(CMAKE_BUILD_TYPE STREQUAL Debug)
    removetestsuffix(${target} BASE)
    add_custom_command(
      TARGET ${target}
      POST_BUILD
      # Transform the target's profraw (generated at compile time) into profdata
      COMMAND LLVM_PROFILE_FILE=./tst/${BASE}/${target}.profraw
              ./tst/${BASE}/${target}
      COMMAND llvm-profdata merge -sparse ./tst/${BASE}/${target}.profraw -o
              ./tst/${BASE}/${target}.profdata
      # Dump line report into html file
      COMMAND
        llvm-cov show ./tst/${BASE}/${target} --ignore-filename-regex=*.h
        -instr-profile=./tst/${BASE}/${target}.profdata -format=html >>
        ./tst/${BASE}/coverage_lines.html
      # Dump summary into
      COMMAND
        llvm-cov report ./tst/${BASE}/${target} --ignore-filename-regex=*.h
        -instr-profile=./tst/${BASE}/${target}.profdata >>
        ./tst/${BASE}/coverage_summary.txt
      # Copy the coverage files into a main directory
      COMMAND mkdir -p ./coverage/${BASE}
      COMMAND cp ./tst/${BASE}/coverage_lines.html ./coverage/${BASE}
      COMMAND cp ./tst/${BASE}/coverage_summary.txt ./coverage/${BASE}
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
  endif()
endfunction()

# Helper function that drops the 'test' suffix from test target strings
function(RemoveTestSuffix target output)
  # Get index of "_test"
  string(FIND ${target} "_test" INDEX REVERSE)
  if(${INDEX} STREQUAL "-1")
    message(
      FATAL_ERROR
        "\n"
        "You have used a test target that does not end with _test.\n"
        "Your test targets must match the regular target name followed by _test.\n"
        "For example, the test target for foo must be foo_test")
  endif()
  # Remove "_test" from string
  string(SUBSTRING ${target} 0 ${INDEX} STRIPPED)
  set(${output} ${STRIPPED})
  # TODO: check if the output target actually exists to sure cmake test target
  # isn't mis-configured.
  return(PROPAGATE ${target} ${output})
endfunction()
