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
      ["#{starts} --> #{ends}", formated_lines].join("\n")
    end

    private

    def formated_lines
      lines.count.eql?(1) ? lines : lines.map { |line| "- #{line}\n" }.join
    end

  end
end
