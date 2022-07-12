# frozen_string_literal: true

# ボウリングのショットを表すクラス
class Shot
  attr_reader :point

  def initialize(mark)
    @point = mark == 'X' ? 10 : mark.to_i
  end
end
