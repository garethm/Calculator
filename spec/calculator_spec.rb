require 'spec_helper'

module Calculator
  describe Calculator do
    describe :add do
      before(:each) do
        @calculator = Calculator.new
      end
      it "accepts 0 numbers and returns 0" do
        result = @calculator.add("")
        result.should equal 0
      end
      it "accepts 1 number and returns the same number" do
        result = @calculator.add("1")
        result.should equal 1
      end
      it "accepts 2 numbers and returns the sum" do
        result = @calculator.add("1,2")
        result.should equal 3
      end
      it "handles new lines instead of commas between numbers" do
        result = @calculator.add("1\n2,3")
        result.should equal 6
      end
      it "allows the delimiters to be specified on the first line" do
        result = @calculator.add("//;\n1;2")
        result.should equal 3
      end
    end
  end
end