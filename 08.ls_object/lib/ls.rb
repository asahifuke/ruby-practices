#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require_relative './normal'
require_relative './detail_file'

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
    files = ARGV.first.nil? ? Dir.entries('.').sort : require_file(ARGV.first).sort
    files = files.reject { |file| file.match?(%r{^\.+$|/\.}) } unless @options['a']
    files
  end

  def require_file(path)
    case path
    when %r{^\./?$}
      Dir.entries('.')
    when %r{^\.\./?$}
      Dir.entries(File.expand_path('..', File.dirname(__FILE__))).map { |name| "../#{name}" }
    else
      Dir.glob(path)
    end
  end

  def run_normal
    Normal.new(@files).run
  end

  def run_detail
    @files.map { |file| DetailFile.new(file).require_line }.unshift "total #{sum_blocks}"
  end

  def sum_blocks
    @files.sum { |file| File.stat(file).blocks }
  end
end

Ls.new.show
