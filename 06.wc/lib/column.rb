# frozen_string_literal: true

class Column
  def initialize(path, options)
    @path = path
    @options = options
  end

  def show
    @options.map.with_index do |option, index|
      all[index].to_s.rjust(8) if option.last
    end.push(" #{@path.rjust(7)}").join
  end

  def all
    [count_lines, count_words, count_byte]
  end

  def count_lines
    File.open(@path) do |file|
      while file.gets; end
      file.lineno
    end
  end

  def count_words
    File.open(@path) do |file|
      total = 0
      while (line_before = file.gets)
        line_after = line_before.split(/\s+/)
        line_after.delete('')
        total += line_after.size
      end
      total
    end
  end

  def count_byte
    File.size(@path)
  end
end
