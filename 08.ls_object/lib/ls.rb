# frozen_string_literal: true

require 'optparse'
require_relative './normal'
require_relative './detail'

class Ls
  def initialize
    @options = ARGV.getopts('a', 'r', 'l')
    @files = require_files
    @files.reverse! if @options['r']
  end

  def show
    puts @options['l'] ? run_detail : run_normal
  end

  private

  def require_files
    files = ARGV.first.nil? ? Dir.entries('.') : ARGV.map { |path| require_file(path) }.first
    files = files.select { |file| !file.match?(/^\.+$|\/\./)} unless @options['a']
    files
  end

  def require_file(path)
    case path
    when '.'
      return Dir.entries('.')
    when '..'
      return Dir.entries(File.expand_path('..', File.dirname(__FILE__))).map { |path| '../' + path } 
    else
      return Dir.glob(path)
    end
  end

  def run_normal
    Normal.new(@files).run
  end

  def run_detail
    @files.map { |file| Detail.new(file).require_line }.unshift "total #{sum_blocks}"
  end

  def sum_blocks
    @files.sum { |file| File.stat(file).blocks }
  end
end

Ls.new.show
