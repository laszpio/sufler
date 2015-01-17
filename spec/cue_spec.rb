require 'spec_helper'

describe Sufler::Cue do

  let(:cue) do
    Sufler::Cue.new(
      starts: "00:00.000",
      ends: "00:01.000",
      lines: "First second's text line"
    )
  end

  let(:multi_lines_cue) do
    Sufler::Cue.new(
      starts: "00:00.000",
      ends: "00:01.000",
      lines: [
        "First second's text part 1",
        "First second's text part 2"
      ]
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

  describe "#lines" do

    context "single text line" do

      subject { cue.lines }

      it { is_expected.to be_a Array }

      it { expect(subject).to include "First second's text line" }

    end

    context "multiple text lines" do

      subject { multi_lines_cue.lines }

      it { is_expected.to be_a Array }

      it { is_expected.to include "First second's text part 1" }

      it { is_expected.to include "First second's text part 2" }

    end

  end

  describe "#to_s" do

    context "single lines cue" do

      subject { cue.to_s }

      it { is_expected.to be_a String }

      it "has 2 lines" do
        expect(subject.lines.size).to be 2
      end

      it "starts with formated times" do
        expect(subject.lines.first).to start_with "#{cue.starts} --> #{cue.ends}"
      end

      it "contains formatted cue's text in the second line" do
        expect(subject.lines.last).to eql cue.lines.first
      end

    end

    context "multi lines cue" do

      subject { multi_lines_cue.to_s }

      it { is_expected.to be_a String }

      it "has 3 lines" do
        expect(subject.lines.size).to be 3
      end

      it "starts with formated times" do
        expect(subject.lines.first).to start_with "#{cue.starts} --> #{cue.ends}"
      end

      it "contains formatted cue's text for every line" do
        is_expected.to match "- First second's text part 1\n"
        is_expected.to match "- First second's text part 2\n"
      end

    end
  end
end
