#include "car/car.h"

namespace CMakeTemplateExample {

void Car::Crash() { isCrashed_ = true; }

void Car::Repair() { isCrashed_ = false; }

bool Car::IsCrashed() const { return isCrashed_; }

} // namespace CMakeTemplateExample
