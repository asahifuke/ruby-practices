# frozen_string_literal: true

require_relative './frame'
require_relative './shot'

class Game
  FRAME_NUMBER = 10
  ZERO = Shot.new(0)

  def initialize(score_text)
    @scores = score_text.split(',')
  end

  def sum
    index = 0
    FRAME_NUMBER.times.sum do
      first  = Shot.new(@scores[index])
      second = Shot.new(@scores[index + 1])
      third  = Shot.new(@scores[index + 2])
      frame  = Frame.new(first, second, ZERO, ZERO)
      index += 2
      if frame.strike?
        frame.second = ZERO
        frame.bonus1 = second
        frame.bonus2 = third
        index -= 1
      elsif frame.spare?
        frame.bonus1 = third
      end
      frame.sum
    end
  end
end
