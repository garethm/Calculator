module Calculator
  class Calculator
    def add input
      parser = Parser.new input
      numbers = parser.numbers
      raise "Negative numbers are not allowed" if numbers.any? { |x| x < 0 }
      sum numbers
    end

    def sum numbers
      numbers.reduce(0, :+)
    end
  end
end