#!/usr/bin/env ruby

require 'optparse'
require 'Date'

class Calendar

  def convert_from_cwday_to_number_of_blank_spaces(number)
    cwday_to_number_of_blank_spaces = {
      1 => 3,
      2 => 6,
      3 => 9,
      4 => 12,
      5 => 15,
      6 => 18,
      7 => 0
    }
    return cwday_to_number_of_blank_spaces[number]
  end

  def initialize
    @options               = ARGV.getopts('y:', 'm:')
    @today                 = Date.today
    @month                 = @options["m"] ? @options["m"] : @today.month
    @year                  = @options["y"] ? @options["y"] : @today.year
    @start_date            = Date.new(@year.to_i, @month.to_i,  1)
    @finish_date           = Date.new(@year.to_i, @month.to_i, -1)
    @blank_space           = " "
    @number_of_blank_space = 6
    @saturday              = 6
  end

  def display
    puts @blank_space * @number_of_blank_space + "#{@month}月 #{@year}"
    puts "日 月 火 水 木 金 土"

    for current_date in @start_date..@finish_date
      if [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(current_date.day)
        print @blank_space
      end

      if current_date == @start_date
        print @blank_space * self.convert_from_cwday_to_number_of_blank_spaces(current_date.cwday)
      end

      if current_date.cwday == @saturday || current_date == @finish_date
        puts current_date.day
      else
        print current_date.day
        print @blank_space
      end
    end
  end

end

calendar = Calendar.new
calendar.display
