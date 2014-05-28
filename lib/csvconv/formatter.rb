require 'json'
require 'yaml'

module CSVConv
  # Format Hash Array
  module Formatter
    def json(hash_array)
      hash_array.map do |hash|
        hash.to_json
      end
    end

    def yaml(hash_array)
      hash_array.to_yaml
    end

    def ltsv(hash_array)
      hash_array.map do |hash|
        hash.map { |key, val| [key, val].join(':') }.join("\t")
      end
    end

    module_function :json, :yaml, :ltsv
  end
end
