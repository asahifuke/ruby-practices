# frozen_string_literal: true

class Shot
  attr_reader :mark

  def initialize(mark)
    @mark = mark == 'X' ? 10 : mark.to_i
  end

  def strike?
    @mark == 10
  end
end
