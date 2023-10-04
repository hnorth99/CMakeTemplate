set(BUILDINFO_TEMPLATE_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(DESTINATION "${CMAKE_CURRENT_BINARY_DIR}/buildinfo")

# Populate timestamp
string(TIMESTAMP TIMESTAMP)

# Populate commit sha
find_program(GIT_PATH git REQUIRED)
execute_process(COMMAND "${GIT_PATH}" log --pretty=format:'%h' -n 1
                OUTPUT_VARIABLE COMMIT_SHA)

# Fill buildinfo.h struct with variables calculated above
configure_file("${BUILDINFO_TEMPLATE_DIR}/buildinfo.h.in"
               "${DESTINATION}/buildinfo.h" @ONLY)

# Function to include the build info struct into the generated target
function(BuildInfo target)
  target_include_directories("${target}" PRIVATE "${DESTINATION}")
endfunction()
