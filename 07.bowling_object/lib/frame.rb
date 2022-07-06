# frozen_string_literal: true

class Frame
  def initialize(shots)
    @shots  = shots
    @first  = shots[0]
    @second = shots[1]
  end

  def sum
    if strike? || spare?
      @shots.sum(&:point)
    else
      @first.point + @second.point
    end
  end

  def spare?
    !strike? && @first.point + @second.point == 10
  end

  def strike?
    @first.point == 10
  end
end
