# frozen_string_literal: true

class Frame
  attr_writer :second, :bonus1, :bonus2

  def initialize(first, second, bonus1, bonus2)
    @first  = first
    @second = second
    @bonus1 = bonus1
    @bonus2 = bonus2
  end

  def sum
    @first.point + @second.point + @bonus1.point + @bonus2.point
  end

  def spare?
    !strike? && @first.point + @second.point == 10
  end

  def strike?
    @first.point == 10
  end
end
