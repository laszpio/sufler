module Sufler
  # The VTT class for webvtt subtitles
  class VTT
    attr_accessor :cues

    def initialize(opts = {})
      @cues = opts.fetch(:cues, [])
    end

    def to_s
      [header, empty_line, *cue_lines].join("\n")
    end

    private

    def header
      'WEBVTT'
    end

    def empty_line
      nil
    end

    def cue_lines
      cues.each_with_index.map { |cue, id| [id + 1, cue.to_s, empty_line] }
    end
  end
end
