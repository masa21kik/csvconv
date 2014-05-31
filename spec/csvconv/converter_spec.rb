require 'spec_helper'

describe CSVConv::Converter do
  shared_examples_for 'convert file format stream' do
    before do
      @input = File.open(input_path)
      @output = StringIO.new
    end

    it 'convert file format stream' do
      cv = CSVConv::Converter.new(format, options)
      cv.convert_stream(@input, @output)
      actual = @output.string
      expected = File.read(input_path.sub(/[^\.]+$/, format))
      expect(actual).to eq expected
    end

    after do
      @input.close
      @output.close
    end
  end

  let(:fixture_dir) { File.expand_path('../../fixtures', __FILE__) }

  context 'CSV with header (books.csv)' do
    let(:input_path) { File.join(fixture_dir, 'books.csv') }
    let(:options) { {} }

    context 'json' do
      let(:format) { 'json' }
      it_behaves_like 'convert file format stream'
    end

    context 'ltsv' do
      let(:format) { 'ltsv' }
      it_behaves_like 'convert file format stream'
    end
  end
end
