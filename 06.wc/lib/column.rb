# frozen_string_literal: true

class Column
  def initialize(options:, texts: nil, name: '', total: nil)
    @texts = texts
    @options = options
    @name = name
    @total = total
  end

  def show
    @options.map.with_index do |option, index|
      all[index].to_s.rjust(8) if option.last
    end.push(" #{@name.rjust(7)}").join
  end

  def all
    @total || [count_lines, count_words, count_byte]
  end

  private

  def count_lines
    @texts.size
  end

  def count_words
    @texts.sum do |text|
      text_after = text.split(/\s+/)
      text_after.delete('')
      text_after.size
    end
  end

  def count_byte
    @texts.sum(&:bytesize)
  end
end
