#pragma once

namespace CMakeTemplateExample {

// LCOV_EXCL_START 
class ICar {
  public:
    virtual ~ICar() = default;
    virtual void Crash() = 0;
    virtual void Repair() = 0;
    virtual bool IsCrashed() const = 0;
};
// LCOV_EXCL_STOP

class Car : public ICar {
  private:
    bool isCrashed_;

  public:
    Car(): isCrashed_(false) {};
    void Crash();
    void Repair();
    bool IsCrashed() const;
};

}  // namespace CMakeTemplateExample