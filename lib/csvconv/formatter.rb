require "json"
require "yaml"

module CSVConv
  # Format Hash Array
  module Formatter
    def json(hash_array)
      hash_array.map {|hash| hash.to_json + "\n" }.join
    end

    def yaml(hash_array)
      hash_array.to_yaml
    end

    def ltsv(hash_array)
      hash_array.map {|hash| hash.map {|key, val| [key, val].join(":") }.join("\t") + "\n" }.join
    end

    module_function :json, :yaml, :ltsv
  end
end
