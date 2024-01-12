#pragma once

namespace CMakeTemplateExample {

class ICar {
public:
  virtual ~ICar() = default;
  virtual void Crash() = 0;
  virtual void Repair() = 0;
  virtual bool IsCrashed() const = 0;
};

class Car : public ICar {
private:
  bool isCrashed_{false};

public:
  void Crash() override;
  void Repair() override;
  bool IsCrashed() const override;
};

} // namespace CMakeTemplateExample
