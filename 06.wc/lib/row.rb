# frozen_string_literal: true

require_relative './column'

class Row
  def initialize(options)
    @options = options
  end

  def show
    total = [0, 0, 0]
    if $stdin
      output = []
      s = []
      while t = $stdin.gets
        s << t
      end
      column = Column.new(texts: s, options: @options)
      total = [total, column.all].transpose.map { |ary| ary.inject(:+) }
      output << column.show
      
    else
      output = 
      ARGV.map do |row|

        s = []
        File.open(row, mode = "rt"){|f|
          s = f.readlines
        }

        column = Column.new(texts: s, name: row, options: @options)
        total = [total, column.all].transpose.map { |ary| ary.inject(:+) }
        column.show
      end
      
    end
    output << Column.new(options: @options, name: 'total', total: total).show if ARGV.size >= 2
    output
  end

end
