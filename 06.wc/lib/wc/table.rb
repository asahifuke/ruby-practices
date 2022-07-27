# frozen_string_literal: true

require_relative './row'

class Table
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
      @output << show_row
    else
      @output =
        ARGV.map do |line|
          File.open(line, 'rt') do |file|
            @texts = file.readlines
          end
          show_row(line)
        end
    end
    @output << Row.new(options: @options, name: 'total', total: @total).show if ARGV.size >= 2
    @output
  end

  private

  def show_row(name = '')
    row = Row.new(texts: @texts, name: name, options: @options)
    @total = [@total, row.all].transpose.map { |ary| ary.inject(:+) }
    row.show
  end
end
