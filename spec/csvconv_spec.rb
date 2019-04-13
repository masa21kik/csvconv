require "spec_helper"

describe Csvconv do
  let(:fixture_dir) { File.expand_path("fixtures", __dir__) }
  it "has a version number" do
    expect(Csvconv::VERSION).not_to be_nil
  end

  shared_examples_for "convert file format" do
    before do
      @input = File.open(input_path)
    end

    def expect_file_path
      dir = File.dirname(input_path)
      base = File.basename(input_path, ".*").sub("_noheader", "")
      File.join(dir, "#{base}.#{format}")
    end

    it "convert file format" do
      actual = Csvconv.send("csv2#{format}", @input, options)
      expected = File.read(expect_file_path)
      expect(actual).to eq expected
    end

    after do
      @input.close
    end
  end

  context "CSV with header (books.csv)" do
    let(:input_path) { File.join(fixture_dir, "books.csv") }
    let(:options) { {} }

    describe "#csv2json" do
      let(:format) { "json" }
      it_behaves_like "convert file format"
    end

    describe "#csv2yaml" do
      let(:format) { "yaml" }
      it_behaves_like "convert file format"
    end

    describe "#csv2ltsv" do
      let(:format) { "ltsv" }
      it_behaves_like "convert file format"
    end
  end

  context "CSV without header (books.csv)" do
    let(:input_path) { File.join(fixture_dir, "books_noheader.csv") }
    let(:options) { { header: %w[Title Author Price] } }

    describe "#csv2json" do
      let(:format) { "json" }
      it_behaves_like "convert file format"
    end

    describe "#csv2yaml" do
      let(:format) { "yaml" }
      it_behaves_like "convert file format"
    end

    describe "#csv2ltsv" do
      let(:format) { "ltsv" }
      it_behaves_like "convert file format"
    end
  end

  context "TSV with header (books.tsv)" do
    let(:input_path) { File.join(fixture_dir, "books.tsv") }
    let(:options) { { sep: "\t" } }

    describe "#csv2json" do
      let(:format) { "json" }
      it_behaves_like "convert file format"
    end

    describe "#csv2yaml" do
      let(:format) { "yaml" }
      it_behaves_like "convert file format"
    end

    describe "#csv2ltsv" do
      let(:format) { "ltsv" }
      it_behaves_like "convert file format"
    end
  end
end
