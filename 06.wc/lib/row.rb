# frozen_string_literal: true

require_relative './column'

class Row
  def initialize(options)
    @argv = ARGV
    @options = options
  end

  def show
    total = [0, 0, 0]

    output =
      @argv.map do |row|
        column = Column.new(row, @options)
        total = [total, column.all].transpose.map { |ary| ary.inject(:+) }
        column.show
      end

    if @argv.size >= 2
      columns =
        @options.map.with_index do |option, index|
          total[index].to_s.rjust(8) if option.last
        end.push(' total').join
      output << columns
    end
    output
  end
end
