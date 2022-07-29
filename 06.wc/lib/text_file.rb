# frozen_string_literal: true

class TextFile
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def count_bytes
    FileTest.size(@name)
  end

  def count_lines
    IO.readlines(@name).count
  end

  def count_words
    File.read(@name).split(/\s+/).size
  end
end
