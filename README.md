# Csvconv

CSV converter to JSON, YAML, LTSV

[![Build Status](https://travis-ci.org/masa21kik/csvconv.png?branch=master)](https://travis-ci.org/masa21kik/csvconv)
[![Coverage Status](https://coveralls.io/repos/masa21kik/csvconv/badge.png)](https://coveralls.io/r/masa21kik/csvconv)
[![Code Climate](https://codeclimate.com/github/masa21kik/csvconv.png?branch=master)](https://codeclimate.com/github/masa21kik/csvconv)

## Installation

Add this line to your application's Gemfile:

    gem 'csvconv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csvconv

## Usage

    $ csvconv [FORMAT] [INPUT] [OPTIONS]

    $ csvconv --json file.csv -o file.json
    $ csvconv --yaml file.csv -o file.yaml
    $ csvconv --ltsv file.csv -o file.ltsv

    Options:
            --json             Output in JSON format
            --yaml             Output in YAML format
            --ltsv             Output in LTSV format
        -s, --separator SEP    Set separator charactor (default is ',')
        -o, --output FILE      Write output to file
        -H, --headers HEADERS  List of headers separated with ','
        -h, --help             Show this message
        -v, --version          Show version

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
