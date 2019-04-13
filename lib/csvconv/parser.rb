require "csv"

module CSVConv
  # Parse CSV to Hash
  module Parser
    def read_header(input, sep)
      CSV.parse_line(input.gets, col_sep: sep)
    end

    def parse_line(input, header, sep)
      Hash[header.zip(CSV.parse_line(input, col_sep: sep))]
    end

    module_function :read_header, :parse_line
  end
end
