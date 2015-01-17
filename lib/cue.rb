module Sufler
  class Cue
    attr_accessor :starts, :ends, :line

    def initialize *args
      self.starts = args.first[:starts]
      self.ends = args.first[:ends]
      self.line = args.first[:line]
    end

    def to_s
      ["#{starts} --> #{ends}", line].join("\n")
    end
  end
end
