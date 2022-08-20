# frozen_string_literal: true

class WcFile
  attr_reader :name

  def initialize(value, name = nil)
    @value = value
    @name = name
  end

  def count_bytes
    @value.size
  end

  def count_lines
    @value.count("\n")
  end

  def count_words
    @value.split(/\s+/).size
  end
end
