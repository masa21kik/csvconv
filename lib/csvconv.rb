require 'csvconv/version'
require 'csvconv/parser'
require 'csvconv/formatter'

# CSV Converter
module CSVConv
  def to_json(input, output, options)
    convert_stream(:json, input, output, options)
  end

  def to_yaml(input, output, options)
    convert(:yaml, input, output, options)
  end

  def to_ltsv(input, output, options)
    convert_stream(:ltsv, input, output, options)
  end

  def convert(format, input, output, options)
    sep = options[:sep] || ','
    header = options[:header] || Parser.read_header(input, sep)
    hash_array = []
    while (l = input.gets)
      hash_array << Parser.parse_line(l, header, sep)
    end
    output.puts Formatter.send(format, hash_array)
  end

  def convert_stream(format, input, output, options)
    sep = options[:sep] || ','
    header = options[:header] || Parser.read_header(input, sep)
    while (l = input.gets)
      hash = Parser.parse_line(l, header, sep)
      output.puts Formatter.send(format, [hash])
    end
  end

  module_function :to_json, :to_yaml, :to_ltsv, :convert, :convert_stream
end
