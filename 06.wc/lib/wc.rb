# frozen_string_literal: true

# !/usr/bin/env ruby

require 'optparse'
require_relative './text_files'
require_relative './standard_input'

class Wc
  def initialize
    @options = ARGV.getopts('l', 'w', 'c')
    change_options
  end

  def show
    ARGV.first.nil? ? show_standard_input : show_text_files
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

  def show_standard_input
    StandardInput.new(@options, require_full_text).show
  end

  def require_full_text
    texts = []
    while (text = $stdin.gets)
      texts << text
    end
    texts
  end

  def show_text_files
    TextFiles.new(@options).show
  end
end

Wc.new.show
