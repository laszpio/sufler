require 'spec_helper'

describe Sufler::VTT do

  let(:cues) do
    Array.new(20) do |i|
      Sufler::Cue.new(
        starts: "00:#{i}.000",
        ends: "00:#{i + 1}.000",
        lines: "Text line no. #{i}"
      )
    end
  end

  let(:empty_vtt) { Sufler::VTT.new }

  let(:sample_vtt) { Sufler::VTT.new(cues: cues) }

  describe "#to_s" do

    context "no cues" do

      subject { empty_vtt.to_s }

      it "has only one line" do
        expect(subject.lines.size).to be 1
      end

      it "contain only header and empty line" do
        expect(subject.lines.first).to match "WEBVTT\n"
      end

    end

    context "with cues" do

      subject { sample_vtt.to_s }

      it "start with header and empty line" do
        is_expected.to start_with "WEBVTT\n"
      end

      it "contains every cue with id" do
        sample_vtt.cues.each_with_index.each do |cue, id|
          is_expected.to match "#{id + 1}\n#{cue}"
        end
      end

    end

  end

end