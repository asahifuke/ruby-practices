# frozen_string_literal: true

require_relative './column'

class Normal
  NUMBER_OF_COLUMNS = 3

  def initialize(files)
    @files = files
    @max_lengthes = create_max_lengthes
    adjust_max_lengthes
    @columns = create_columns
  end

  def run
    adjust_max_lengthes
    split_by_column
    display_one_line_at_a_time
  end

  def create_max_lengthes
    Array.new(NUMBER_OF_COLUMNS) { divide_by_NUMBER_OF_COLUMNS }
  end

  def create_columns
    @max_lengthes.map { |max_length| Column.new(max_length) }
  end

  def adjust_max_lengthes
    0.upto(remainder_divided_by_NUMBER_OF_COLUMNS - 1) { |index| @max_lengthes[index] += 1 }
  end

  def split_by_column
    index = 0
    @files.each do |file|
      index += 1 if @columns[index].max_file_size < @columns[index].size + 1
      @columns[index].add(file)
    end
  end

  def display_one_line_at_a_time
    Array.new(number_of_files_in_a_column) do |index|
      @columns.map { |column| column.place(index) }.join('   ')
    end.join("\n")
  end

  def number_of_files_in_a_column
    remainder_divided_by_NUMBER_OF_COLUMNS.zero? ? divide_by_NUMBER_OF_COLUMNS : divide_by_NUMBER_OF_COLUMNS + 1
  end

  def divide_by_NUMBER_OF_COLUMNS
    @files.size / NUMBER_OF_COLUMNS
  end

  def remainder_divided_by_NUMBER_OF_COLUMNS
    @files.size % NUMBER_OF_COLUMNS
  end
end
