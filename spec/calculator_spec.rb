require 'spec_helper'

module Calculator
  describe Calculator do
    describe "add" do
      it "accepts 0 numbers and returns 0" do
        calculator = Calculator.new
        result = calculator.add("")
        result.should equal 0
      end
      it "accepts 1 number and returns the same number" do
        calculator = Calculator.new
        result = calculator.add("1")
        result.should equal 1
      end
      it "accepts 2 numbers and returns the sum" do
        calculator = Calculator.new
        result = calculator.add("1,2")
        result.should equal 3
      end
    end
  end
end