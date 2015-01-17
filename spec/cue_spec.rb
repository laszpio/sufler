require 'spec_helper'

describe Sufler::Cue do

  let(:cue) do
    Sufler::Cue.new(
      starts: "00:00.000",
      ends: "00:01.000",
      line: "First second"
    )
  end

  describe "#starts" do

    subject { cue.starts }

    it { expect(subject).to be_a String }

  end

  describe "#ends" do

    subject { cue.ends }

    it { expect(subject).to be_a String }

  end

  describe "#line" do

    subject { cue.line }

    it { expect(subject).to be_a String }

  end

  describe "#to_s" do

    it { expect(cue.to_s).to be_a String }

    let(:lines) { cue.to_s.lines }

    context "1st line" do

      subject { lines[0] }

      it "starts with time marks" do
        expect(subject).to start_with "#{cue.starts} --> #{cue.ends}"
      end

    end

    context "2nd line" do

      subject { lines[1] }

      it "contains cue's text" do
        expect(subject).to match cue.line
      end

    end

  end
end
