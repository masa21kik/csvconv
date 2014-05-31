require 'spec_helper'

describe CSVConv do
  it 'should have a version number' do
    CSVConv::VERSION.should_not be_nil
  end

  shared_examples_for 'convert file format' do
    before do
      @input = File.open(input_csv)
    end

    it 'convert file format' do
      actual = CSVConv.send("csv2#{format}", @input, options)
      expected = File.read(input_csv.sub(/csv$/, format))
      expect(actual).to eq expected
    end

    after do
      @input.close
    end
  end

  let(:fixture_dir) { File.expand_path('../fixtures', __FILE__) }

  context 'CSV with header (books.csv)' do
    let(:input_csv) { File.join(fixture_dir, 'books.csv') }
    let(:options) { {} }

    describe '#csv2json' do
      let(:format) { 'json' }
      it_behaves_like 'convert file format'
    end

    describe '#csv2yaml' do
      let(:format) { 'yaml' }
      it_behaves_like 'convert file format'
    end

    describe '#csv2ltsv' do
      let(:format) { 'ltsv' }
      it_behaves_like 'convert file format'
    end
  end
end
