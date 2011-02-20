module Calculator
  class Calculator
    def add numbers
      numbers.split(",").reduce(0) do |sum, number|
        sum + number.to_i
      end
    end
  end
end