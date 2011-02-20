module Calculator
  class Calculator
    DEFAULT_DELIMITER = /(,|\n)/

    def use_default_delimiter?
      not @input.start_with? '//'
    end

    def get_parsed_delimiters
      delimiter_string = @input.split(/\n/)[0][2..-1]
      options = delimiter_string.chars.reduce([]) do |list, item|
        list << Regexp.escape(item)
      end
      Regexp.union(options)
    end

    def get_delimiters
      return DEFAULT_DELIMITER if use_default_delimiter?
      return get_parsed_delimiters
    end

    def add input
      @input = input

      @input.split(get_delimiters).reduce(0) do |sum, number|
        sum + number.to_i
      end
    end
  end
end