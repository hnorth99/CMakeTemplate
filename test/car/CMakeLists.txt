# Create test runner executable
add_executable(car_test car_test.cpp)
target_link_libraries(car_test PRIVATE car_static)

# Configure test runner within rest of projects test suite
addtests(car_test)
