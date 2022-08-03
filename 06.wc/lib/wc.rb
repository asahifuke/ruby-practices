# frozen_string_literal: true

# !/usr/bin/env ruby

require 'optparse'
require_relative './arguments'
require_relative './argument'

class Wc
  def initialize
    @options = ARGV.getopts('l', 'w', 'c')
    @inputs = ARGV.first.nil? ? create_stdin : create_text_files
    change_options
  end

  def show
    Arguments.new(@options, @inputs).show
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
    [Argument.new($stdin.read)]
  end

  def create_text_files
    ARGV.map { |value| Argument.new(File.read(value), value) }
  end
end

Wc.new.show
