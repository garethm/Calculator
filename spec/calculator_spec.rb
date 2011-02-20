require 'spec_helper'

module Calculator
  describe Calculator do
    describe "add" do
      it "accepts 0 numbers and returns 0" do
        calculator = Calculator.new
        result = calculator.add("")
        result.should equal 0
      end
      it "accepts 1 number and returns the same number"
      it "accepts 2 numbers and returns the sum"
    end
  end
end