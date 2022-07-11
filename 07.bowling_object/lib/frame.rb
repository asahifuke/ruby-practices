# frozen_string_literal: true

# １フレームの合計点を計算する
class Frame
  def initialize(shots)
    @shots = shots
  end

  def sum
    if strike? || spare?
      @shots.sum(&:point)
    else
      first_two_sum
    end
  end

  def strike?
    @shots.first.point == 10
  end

  private

  def first_two_sum
    @shots[0..1].sum(&:point)
  end

  def spare?
    !strike? && first_two_sum == 10
  end
end
