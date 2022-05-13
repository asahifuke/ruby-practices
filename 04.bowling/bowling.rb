#!/usr/bin/env ruby
# frozen_string_literal: true

class Bowling
  FIRST_STRIKE_SCORE  = 10
  SECOND_STRIKE_SCORE = 0
  SPARE_SCORE         = 10
  NO_BOUNUS           = 0

  def initialize
    @throws = ARGV[0].split(',')
  end

  def play
    total       = 0
    throw_index = 0

    10.times do
      first_score  = score(@throws[throw_index])
      second_score = score(@throws[throw_index + 1])
      third_score  = score(@throws[throw_index + 2])

      if first_score == FIRST_STRIKE_SCORE
        bonus = second_score + third_score
        total += FIRST_STRIKE_SCORE + SECOND_STRIKE_SCORE + bonus
        throw_index += 1
      else
        bonus = first_score + second_score == SPARE_SCORE ? third_score : NO_BOUNUS
        total += first_score + second_score + bonus
        throw_index += 2
      end
    end
    puts total
  end

  private

  def score(throw)
    throw == 'X' ? FIRST_STRIKE_SCORE : throw.to_i
  end
end

bowling = Bowling.new
bowling.play
