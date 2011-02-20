module Calculator
  class Calculator
    def add input
      parser = Parser.new input
      sum parser.numbers
    end

    def sum numbers
      numbers.reduce(0) do |sum, number|
        sum + number.to_i
      end
    end
  end
end