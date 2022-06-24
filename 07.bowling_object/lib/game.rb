# frozen_string_literal: true

require_relative './frame'
require_relative './shot'

class Game
  FRAME_NUMBER = 10
  ZERO = Shot.new(0)

  def initialize(scores)
    scores = scores.split(',')
    index = 0
    @frames =
      Array.new(FRAME_NUMBER) do
        first  = Shot.new(scores[index])
        second = Shot.new(scores[index + 1])
        third  = Shot.new(scores[index + 2])
        if first.strike?
          index += 1
          Frame.new(first, ZERO, second, third)
        elsif first.mark + second.mark == 10
          index += 2
          Frame.new(first, second, third, ZERO)
        else
          index += 2
          Frame.new(first, second, ZERO, ZERO)
        end
      end
  end

  def sum
    @frames.sum(&:sum)
  end
end
