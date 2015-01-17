require 'spec_helper'

describe Sufler::Cue do

  let(:cue) do
    Sufler::Cue.new(
      starts: "00:00.000",
      ends: "00:01.000",
      line: "First second text"
    )
  end

  describe "#starts" do

    subject { cue.starts }

    it { is_expected.to be_a String }

    it { is_expected.to eql "00:00.000" }

  end

  describe "#ends" do

    subject { cue.ends }

    it { is_expected.to be_a String }

    it { is_expected.to eql "00:01.000" }

  end

  describe "#line" do

    subject { cue.line }

    it { is_expected.to be_a String }

    it { is_expected.to eql "First second text" }
  end

  describe "#to_s" do

    subject { cue.to_s }

    it { is_expected.to be_a String }

    let(:string_lines) { cue.to_s.lines }

    context "1st line" do

      subject { string_lines.first }

      it "starts with time marks" do
        expect(subject).to start_with "#{cue.starts} --> #{cue.ends}"
      end

    end

    context "2nd line" do

      subject { string_lines[1] }

      it "contains cue's text" do
        expect(subject).to match cue.line
      end

    end
  end
end
