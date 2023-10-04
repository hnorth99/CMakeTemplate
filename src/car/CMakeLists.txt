# General object to get reused in different generated assets
add_library(car_obj OBJECT car.cpp)
target_include_directories(car_obj PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
set_target_properties(car_obj PROPERTIES
    PUBLIC_HEADER src/car/include/car/car.h
    POSITION_INDEPENDENT_CODE 1
)

# Create static and shared library versions
add_library(car_shared SHARED)
target_link_libraries(car_shared car_obj)
add_library(car_static STATIC)
target_link_libraries(car_static car_obj)

# Testing and program analysis modules
include(Coverage)
enablecoverage(car_obj)
cleancoverage(car_static)
include(CppCheck)
addcppcheck(car_obj)

# TODO: documentation generation
