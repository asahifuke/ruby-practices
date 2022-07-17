# frozen_string_literal: true

require_relative './column'
require 'etc'

class List
  NUMBER_OF_COLUMNS = 3

  def initialize(args, is_reverse, is_detail)
    @files_directories = Dir.glob(*args)
    @files_directories.reverse! if is_reverse
    @is_detail = is_detail
  end

  def show
    @is_detail ? show_detail : show_normal
  end

  private

  def show_detail
    total = 0
    @files_directories.map do |file_directorie|
      @stat = File.stat(file_directorie)
      total += @stat.blocks
      @mode = @stat.mode.to_s(8).rjust(6, '0')
      user = Etc.getpwuid(@stat.uid).name
      group = Etc.getgrgid(@stat.gid).name
      [
        file_type + permission,
        @stat.nlink.to_s.rjust(2),
        user,
        group.rjust(6),
        @stat.size.to_s.rjust(5),
        @stat.mtime.strftime('%-m %d %H:%M'),
        file_directorie
      ].join(' ')
    end.unshift "total #{total}"
  end

  def file_type
    {
      'file' => '-',
      'directory' => 'd',
      'characterSpecial' => 'c',
      'blockSpecial' => 'b',
      'fifo' => 'p',
      'link' => 'l',
      'socket' => 's'
    }[@stat.ftype]
  end

  def permission
    @mode[3..5].chars.sum('') do |permission|
      {
        '0' => '---',
        '1' => '--x',
        '2' => '-w-',
        '3' => '-wx',
        '4' => 'r--',
        '5' => 'r-x',
        '6' => 'rw-',
        '7' => 'rwx'
      }[permission]
    end
  end

  def show_normal
    size = @files_directories.size
    number_of_files_in_a_column = size / NUMBER_OF_COLUMNS
    number_of_files_in_a_column += 1 unless (size % NUMBER_OF_COLUMNS).zero?
    columns = Array.new(NUMBER_OF_COLUMNS) { Column.new }
    @files_directories.each_with_index do |file, i|
      columns[i / number_of_files_in_a_column].add(file)
    end

    Array.new(number_of_files_in_a_column) do |i|
      columns.map { |column| column.show(i) }.join('   ')
    end.join("\n")
  end
end
