#!/usr/bin/env ruby
# frozen_string_literal: true

class Bowling
  FIRST_STRIKE_SCORE  = 10
  SECOND_STRIKE_SCORE = 0
  SPARE_SCORE         = 10
  NO_BOUNUS           = 0

  def initialize
    @throwing_balls = ARGV[0].split(',')
  end

  def play
    total               = 0
    throwing_ball_index = 0

    10.times do
      first_score  = score(@throwing_balls[throwing_ball_index])
      second_score = score(@throwing_balls[throwing_ball_index + 1])
      third_score  = score(@throwing_balls[throwing_ball_index + 2])

      if first_score == FIRST_STRIKE_SCORE
        bonus = second_score + third_score
        total += FIRST_STRIKE_SCORE + SECOND_STRIKE_SCORE + bonus
        throwing_ball_index += 1
      else
        bonus = first_score + second_score == SPARE_SCORE ? third_score : NO_BOUNUS
        total += first_score + second_score + bonus
        throwing_ball_index += 2
      end
    end
    puts total
  end

  private

  def score(throwing_ball)
    throwing_ball == 'X' ? FIRST_STRIKE_SCORE : throwing_ball.to_i
  end
end

bowling = Bowling.new
bowling.play
