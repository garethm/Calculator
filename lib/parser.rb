module Calculator
  class Parser
    DEFAULT_DELIMITER = /,|\n/

    def initialize input
      @input = input
      @delimiters = get_delimiters
      @data = get_data
    end

    def get_delimiters
      return DEFAULT_DELIMITER if use_default_delimiter?
      get_parsed_delimiters
    end

    def get_data
      return @input if use_default_delimiter?
      @input[@input.index("\n")+1..-1]
    end

    def use_default_delimiter?
      not @input.start_with? '//'
    end

    def get_parsed_delimiters
      get_delimiter_regexp delimiter_line[2..-1]
    end

    def get_delimiter_regexp delimiter_string
      options = delimiter_string.chars.reduce([]) do |list, item|
        list << Regexp.escape(item)
      end
      Regexp.union(options)
    end

    def delimiter_line
      @input.split(/\n/)[0]
    end

    def numbers
      list = @data.split @delimiters
      list.map { |number| number.to_i }
    end
  end
end