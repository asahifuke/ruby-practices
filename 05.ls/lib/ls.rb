# frozen_string_literal: true

require 'optparse'
require_relative './list'

options = ARGV.getopts('a')
args = ['*']
args << File::FNM_DOTMATCH if options['a']
puts List.new(args).show
