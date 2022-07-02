# frozen_string_literal: true

class Frame
  def initialize(first, second, third)
    @first  = first
    @second = second
    @third  = third
  end

  def sum
    if strike? || spare?
      @first.point + @second.point + @third.point
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
