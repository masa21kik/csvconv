require "csvconv/version"
require "csvconv/parser"
require "csvconv/formatter"
require "csvconv/converter"

# CSV Converter
module CSVConv
  def csv2json(input, options)
    cv = Converter.new(:json, options)
    cv.convert(input)
  end

  def csv2yaml(input, options)
    cv = Converter.new(:yaml, options)
    cv.convert(input)
  end

  def csv2ltsv(input, options)
    cv = Converter.new(:ltsv, options)
    cv.convert(input)
  end

  module_function :csv2json, :csv2yaml, :csv2ltsv
end
