require 'spec_helper'

describe CSVConv do
  it 'should have a version number' do
    CSVConv::VERSION.should_not be_nil
  end

  shared_examples_for 'convert file format' do
    before do
      @input = File.open(input_csv)
      @output = StringIO.new
    end

    it 'convert file format' do
      CSVConv.send("to_#{format}", @input, @output, options)
      expected_result = File.read(input_csv.sub(/csv$/, format))
      expect(@output.string).to eq expected_result
    end

    after do
      @input.close
      @output.close
    end
  end

  let(:fixture_dir) { File.expand_path('../fixtures', __FILE__) }

  context 'CSV with header (books.csv)' do
    let(:input_csv) { File.join(fixture_dir, 'books.csv') }
    let(:options) { {} }

    describe '#to_json' do
      let(:format) { 'json' }
      it_behaves_like 'convert file format'
    end

    describe '#to_yaml' do
      let(:format) { 'yaml' }
      it_behaves_like 'convert file format'
    end

    describe '#to_ltsv' do
      let(:format) { 'ltsv' }
      it_behaves_like 'convert file format'
    end
  end
end
