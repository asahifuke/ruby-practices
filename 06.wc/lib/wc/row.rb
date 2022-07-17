# frozen_string_literal: true

require_relative './column'

class Row
  def initialize(options)
    @options = options
  end

  def show
    @total = [0, 0, 0]
    @texts = []
    if ARGV.first.nil?
      @output = []
      while (text = $stdin.gets)
        @texts << text
      end
      @output << show_column
    else
      @output =
        ARGV.map do |row|
          File.open(row, 'rt') do |file|
            @texts = file.readlines
          end
          show_column(row)
        end
    end
    @output << Column.new(options: @options, name: 'total', total: @total).show if ARGV.size >= 2
    @output
  end

  private

  def show_column(name = '')
    column = Column.new(texts: @texts, name: name, options: @options)
    @total = [@total, column.all].transpose.map { |ary| ary.inject(:+) }
    column.show
  end
end
