# frozen_string_literal: true

# !/usr/bin/env ruby

require 'optparse'
require_relative '../lib/wc/row'

def main
  options = ARGV.getopts('l', 'w', 'c')
  unless options['l'] || options['w'] || options['c']
    options['l'] = true
    options['w'] = true
    options['c'] = true
  end

  rows = Row.new(options)
  puts rows.show
end
main
