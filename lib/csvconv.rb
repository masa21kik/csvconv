require 'csvconv/version'
require 'csvconv/parser'
require 'csvconv/formatter'
require 'csvconv/converter'

# CSV Converter
module CSVConv
  def to_json(input, output, options)
    cv = Converter.new(:json, options)
    cv.convert_stream(input, output)
  end

  def to_yaml(input, output, options)
    cv = Converter.new(:yaml, options)
    cv.convert(input, output)
  end

  def to_ltsv(input, output, options)
    cv = Converter.new(:ltsv, options)
    cv.convert_stream(input, output)
  end

  module_function :to_json, :to_yaml, :to_ltsv
end
