#include "car/car.h"
#include <gtest/gtest.h>

TEST(CarTest, InitializesNotCrashed) {
  const CMakeTemplateExample::Car test_car;
  ASSERT_FALSE(test_car.IsCrashed());
}

TEST(CarTest, CanCrash) {
  CMakeTemplateExample::Car test_car;
  test_car.Crash();
  ASSERT_TRUE(test_car.IsCrashed());
}

TEST(CarTest, CanRepair) {
  CMakeTemplateExample::Car test_car;
  test_car.Crash();
  ASSERT_TRUE(test_car.IsCrashed());
  test_car.Repair();
  ASSERT_FALSE(test_car.IsCrashed());
}
