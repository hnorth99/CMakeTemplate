# This cmake module serves as a linter for a cpp target
function(AddCppCheck target)
  find_program(CPPCHECK_PATH cppcheck REQUIRED)
  set_target_properties(
    "${target}"
    PROPERTIES CXX_CPPCHECK
               "${CPPCHECK_PATH};--enable=warning;--error-exitcode=10")
endfunction()
