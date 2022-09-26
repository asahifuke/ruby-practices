# frozen_string_literal: true

class WcFiles
  def initialize(options, values)
    @options = options
    @values = values 
  end

  def show
    puts show_files
    puts show_total if @values.size >= 2
  end

  private

  def show_files
    @values.map do |value|
      "#{count_lines(value)}#{count_words(value)}#{count_bytes(value)} #{value.name}"
    end
  end

  def show_total
    "#{sum_lines}#{sum_words}#{sum_bytes} total"
  end

  def count_lines(value)
    value.count_lines.to_s.rjust(8) if @options['l']
  end

  def count_words(value)
    value.count_words.to_s.rjust(8) if @options['w']
  end

  def count_bytes(value)
    value.count_bytes.to_s.rjust(8) if @options['c']
  end

  def sum_bytes
    @values.sum(&:count_bytes).to_s.rjust(8) if @options['c']
  end

  def sum_lines
    @values.sum(&:count_lines).to_s.rjust(8) if @options['l']
  end

  def sum_words
    @values.sum(&:count_words).to_s.rjust(8) if @options['w']
  end
end
