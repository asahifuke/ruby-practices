# frozen_string_literal: true

# ポイントを管理する
class Shot
  attr_reader :point

  def initialize(mark)
    @point = mark == 'X' ? 10 : mark.to_i
  end
end
