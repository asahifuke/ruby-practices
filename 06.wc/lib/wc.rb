# frozen_string_literal: true

# !/usr/bin/env ruby

require 'optparse'
require_relative './wc_files'
require_relative './wc_file'

class Wc
  def initialize
    @options = ARGV.getopts('l', 'w', 'c')
    @inputs = ARGV.first.nil? ? create_stdin : create_text_files
    change_options
  end

  def show
    WcFiles.new(@options, @inputs).show
  end

  private

  def change_options
    return unless all_options_false?

    @options['l'] = true
    @options['w'] = true
    @options['c'] = true
  end

  def all_options_false?
    !@options['l'] && !@options['w'] && !@options['c']
  end

  def create_stdin
    [WcFile.new($stdin.read)]
  end

  def create_text_files
    ARGV.map { |value| WcFile.new(File.read(value), value) }
  end
end

Wc.new.show
