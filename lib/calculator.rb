require 'Parser'

module Calculator
  class NegativeNumberError < StandardError
  end

  class Calculator
    def add input
      parser = Parser.new input
      numbers = parser.numbers
      raise_if_negative numbers
      sum numbers
    end

    def sum numbers
      numbers.reduce(0, :+)
    end

    def raise_if_negative numbers
      negatives = numbers.find_all { |x| x < 0 }
      return if negatives.length == 0
      raise NegativeNumberError, "Negative numbers are not allowed (#{number_list_to_string negatives})"
    end

    def number_list_to_string numbers
      numbers.reduce("") do |result, number|
        result << ", " if result != ""
        result << number.to_s
      end
    end
  end
end