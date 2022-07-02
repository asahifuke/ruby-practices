# frozen_string_literal: true

require 'optparse'
require_relative './list'

options = ARGV.getopts('a', 'r')
args = ['*']
args << File::FNM_DOTMATCH if options['a']
puts List.new(args, options['r']).show
