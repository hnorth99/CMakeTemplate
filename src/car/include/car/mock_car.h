#pragma once
#include <gmock/gmock.h>
#include "car/car.h"

namespace CMakeTemplateExample {

class MockCar : public ICar {
  public:
    MOCK_METHOD(void, Crashed, (), (const, override));
}

} // namespace CMakeTemplateExample