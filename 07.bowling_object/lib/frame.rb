# frozen_string_literal: true

class Frame
  def initialize(shots)
    @shots = shots
  end

  def sum
    if strike? || spare?
      @shots.sum(&:point)
    else
      add_first_and_second
    end
  end

  def strike?
    @shots[0].point == 10
  end

  private

  def add_first_and_second
    @shots[0..1].sum(&:point)
  end

  def spare?
    !strike? && add_first_and_second == 10
  end
end
