require 'spec_helper'

module Calculator
  describe Parser do
    describe :numbers do
      it "parses '' to []" do
        parser = Parser.new ''
        parser.numbers.should == []
      end
      
      it "parses '1' to [1]" do
        parser = Parser.new '1'
        parser.numbers.should == [1]
      end

      it "parses '1,2' to [1,2]" do
        parser = Parser.new '1,2'
        parser.numbers.should == [1,2]
      end

      it "parses \"1\\n2,3\" to [1,2,3]" do
        parser = Parser.new "1\n2,3"
        parser.numbers.should == [1,2,3]
      end

      it "parses \"//;\\n1;2;3;4\" to [1,2,3,4]" do
        parser = Parser.new "//;\n1;2;3;4"
        parser.numbers.should == [1,2,3,4]
      end
    end
  end
end