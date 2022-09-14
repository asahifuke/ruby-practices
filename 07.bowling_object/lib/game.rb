# frozen_string_literal: true

require_relative './frame'
require_relative './shot'

class Game
  def initialize(score_text)
    @scores = score_text.split(',')
  end

  def sum
    index = 0
    10.times.sum do
      shots = @scores[index, 3].map { |mark| Shot.new(mark) }
      frame  = Frame.new(shots)
      index += frame.strike? ? 1 : 2
      frame.sum
    end
  end
end
