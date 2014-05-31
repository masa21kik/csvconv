module CSVConv
  # Converter from CSV
  class Converter
    def initialize(format, options)
      @format = format
      @sep = options[:sep] || ','
      @header = options[:header]
    end

    def convert(input)
      @header ||= Parser.read_header(input, @sep)
      hash_array = []
      while (line = input.gets)
        hash_array << Parser.parse_line(line, @header, @sep)
      end
      Formatter.send(@format, hash_array)
    end

    def convert_stream(input, output)
      @header ||= Parser.read_header(input, @sep)
      while (line = input.gets)
        hash = Parser.parse_line(line, @header, @sep)
        output.puts Formatter.send(@format, [hash])
      end
    end
  end
end
