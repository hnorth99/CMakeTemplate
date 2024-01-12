#pragma once
#include "car/car.h"
#include <gmock/gmock.h>

namespace CMakeTemplateExample {

class MockCar : public ICar {
public:
  MOCK_METHOD(void, Crashed, (), (const, override));
}

} // namespace CMakeTemplateExample
