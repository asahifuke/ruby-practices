# frozen_string_literal: true

require_relative './frame'
require_relative './shot'

class Game
  FRAME_NUMBER = 10

  def initialize(score_text)
    @scores = score_text.split(',')
  end

  def sum
    index = 0
    FRAME_NUMBER.times.sum do
      first  = Shot.new(@scores[index])
      second = Shot.new(@scores[index + 1])
      third  = Shot.new(@scores[index + 2])
      frame  = Frame.new(first, second, third)
      index += frame.strike? ? 1 : 2
      frame.sum
    end
  end
end
