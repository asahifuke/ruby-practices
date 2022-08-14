# frozen_string_literal: true

class Column
  attr_reader :max_file_size

  def initialize(max_file_size)
    @files = []
    @max_file_size = max_file_size
  end

  def add(file)
    @files << file.sub(%r{\.+/}, '')
  end

  def size
    @files.size
  end

  def place(line)
    @files[line] ? @files[line].ljust(@files.map(&:size).max) : nil
  end
end
