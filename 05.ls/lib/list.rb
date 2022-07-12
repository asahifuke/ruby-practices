# frozen_string_literal: true

require_relative './column'

class List
  NUMBER_OF_COLUMNS = 3

  def initialize(args, is_reverse)
    files_directories = Dir.glob(*args)
    files_directories.reverse! if is_reverse
    size = files_directories.size
    @number_of_files_in_a_column = size / NUMBER_OF_COLUMNS
    @number_of_files_in_a_column += 1 unless (size % NUMBER_OF_COLUMNS).zero?
    @columns = Array.new(NUMBER_OF_COLUMNS) { Column.new }
    files_directories.each_with_index do |file, i|
      @columns[i / @number_of_files_in_a_column].add(file)
    end
  end

  def show
    Array.new(@number_of_files_in_a_column) do |i|
      @columns.map { |column| column.show(i) }.join('   ')
    end.join("\n")
  end
end
