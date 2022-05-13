#!/usr/bin/env ruby
# frozen_string_literal: true
require 'optparse'
require 'Date'
class Calendar
  DAY_OF_WEEK = '日 月 火 水 木 金 土'
  SATURDAY    = 6

  def initialize
    @options = ARGV.getopts('y:', 'm:')
  end

  def show
    today       = Date.today
    month       = @options['m'] || today.month
    year        = @options['y'] || today.year
    start_date  = Date.new(year.to_i, month.to_i,  1)
    finish_date = Date.new(year.to_i, month.to_i, -1)

    puts "#{month}月 #{year}".center(20)
    puts DAY_OF_WEEK

    (start_date..finish_date).each do |current_date|
      current_day  = current_date.day.to_s.rjust(2).ljust(3)
      current_wday = current_date.wday
      if current_date == start_date
        print current_day.rjust((current_wday + 1) * 3)
      elsif current_wday == SATURDAY || current_date == finish_date
        puts current_day
      else
        print current_day
      end
    end
  end
end

calendar = Calendar.new
calendar.show
