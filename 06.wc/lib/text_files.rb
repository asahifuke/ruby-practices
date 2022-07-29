# frozen_string_literal: true

require_relative './text_file'

class TextFiles
  def initialize(options)
    @options = options
  end

  def show
    puts show_files
    puts show_total if ARGV.size >= 2
  end

  private

  def text_files
    ARGV.map { |argv| TextFile.new(argv) }
  end

  def show_files
    text_files.map do |text_file|
      "#{count_lines(text_file)}#{count_words(text_file)}#{count_bytes(text_file)} #{text_file.name}"
    end
  end

  def show_total
    "#{sum_lines}#{sum_words}#{sum_bytes} total"
  end

  def count_lines(text_file)
    text_file.count_lines.to_s.rjust(8) if @options['l']
  end

  def count_words(text_file)
    text_file.count_words.to_s.rjust(8) if @options['w']
  end

  def count_bytes(text_file)
    text_file.count_bytes.to_s.rjust(8) if @options['c']
  end

  def sum_bytes
    text_files.sum(&:count_bytes).to_s.rjust(8) if @options['c']
  end

  def sum_lines
    text_files.sum(&:count_lines).to_s.rjust(8) if @options['l']
  end

  def sum_words
    text_files.sum(&:count_words).to_s.rjust(8) if @options['w']
  end
end
