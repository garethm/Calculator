module Calculator
  class Calculator
    DEFAULT_DELIMITER = /(,|\n)/

    def use_default_delimiter? numbers
      not numbers.start_with? '//'
    end

    def get_delimiters numbers
      return DEFAULT_DELIMITER if use_default_delimiter?

      delimiter_string = numbers.split(/\n/)[0][2..-1]
      options = delimiter_string.chars.reduce([]) do |list, item|
        list << Regexp.escape(item)
      end
      Regexp.union(options)
    end

    def add numbers
      if numbers.start_with? '//'
        delimiter_string = numbers.split(/\n/)[0][2..-1]
        options = delimiter_string.chars.reduce([]) do |list, item|
          list << Regexp.escape(item)
        end
        delimiters = Regexp.union(options)
      else
        delimiters = /(,|\n)/
      end
      numbers.split(delimiters).reduce(0) do |sum, number|
        sum + number.to_i
      end
    end
  end
end