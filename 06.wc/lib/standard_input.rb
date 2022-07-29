# frozen_string_literal: true

class StandardInput
  def initialize(option, texts)
    @options = option
    @texts = texts
  end

  def show
    puts "#{count_lines}#{count_words}#{count_bytes}"
  end

  private

  def count_lines
    @texts.size.to_s.rjust(8) if @options['l']
  end

  def count_words
    return unless @options['w']

    @texts.sum do |text|
      text_after = text.split(/\s+/)
      text_after.delete('')
      text_after.size
    end.to_s.rjust(8)
  end

  def count_bytes
    @texts.sum(&:bytesize).to_s.rjust(8) if @options['c']
  end
end
