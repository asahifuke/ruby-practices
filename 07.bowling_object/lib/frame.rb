# frozen_string_literal: true

class Frame
  def initialize(first, second, bonus1, bonus2)
    @first  = first
    @second = second
    @bonus1 = bonus1
    @bonus2 = bonus2
  end

  def sum
    @first.mark + @second.mark + @bonus1.mark + @bonus2.mark
  end
end
