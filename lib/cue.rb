module Sufler
  # The Cue class is responsible for handling a single cue
  class Cue
    attr_accessor :starts, :ends, :lines

    def initialize opts = {}
      if !opts.empty?
        @starts = opts[:starts]
        @ends = opts[:ends]
        @lines  = opts[:lines].is_a?(Array) ? opts[:lines] : [opts[:lines]]
      end
    end

    def to_s
      [timestamp_header, formated_lines].join("\n")
    end

    private

    def timestamp_header
      "#{starts} --> #{ends}"
    end

    def formated_lines
      lines.count.eql?(1) ? lines : lines.map { |line| "- #{line}\n" }.join
    end

  end
end
