# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/ls'

class ListTest < Minitest::Test
  def test_normal
    list = List.new(['*'], false, false)
    output = 'column_test.rb   ls_test.rb   '
    assert_equal output, list.show
  end

  def test_a
    list = List.new(['*', File::FNM_DOTMATCH], false, false)
    output = '.           column_test.rb   \n.DS_Store   ls_test.rb       '
    assert_equal output, list.show
  end

  def test_r
    list = List.new(['*'], true, false)
    output = 'ls_test.rb   column_test.rb   '
    assert_equal output, list.show
  end

  def test_ar
    list = List.new(['*', File::FNM_DOTMATCH], true, false)
    output = 'ls_test.rb       .DS_Store   \ncolumn_test.rb   .           '
    assert_equal output, list.show
  end

  def test_l
    list = List.new(['*'], false, true)
    output = ['total 16', '-rw-r--r--  1 asahi.fuke  staff   540  7 13 10:56 column_test.rb', '-rw-r--r--  1 asahi.fuke  staff  1440  7 13 15:00 ls_test.rb']
    assert_equal output, list.show
  end

  def test_lr
    list = List.new(['*'], true, true)
    output = ['total 16', '-rw-r--r--  1 asahi.fuke  staff   540  7 13 10:56 column_test.rb', '-rw-r--r--  1 asahi.fuke  staff  1694  7 13 15:02 ls_test.rb']
    assert_equal output, list.show
  end

  def test_al
    list = List.new(['*', File::FNM_DOTMATCH], false, true)
    output = ['total 32', 'drwxr-xr-x  5 asahi.fuke  staff   160  7 13 10:56 .', '-rw-r--r--  1 asahi.fuke  staff  6148  6 09 12:54 .DS_Store',
              '-rw-r--r--  1 asahi.fuke  staff   540  7 13 10:56 column_test.rb', '-rw-r--r--  1 asahi.fuke  staff  1440  7 13 15:00 ls_test.rb']
    assert_equal output, list.show
  end

  def test_alr
    list = List.new(['*', File::FNM_DOTMATCH], true, true)
    output = ['total 32', 'drwxr-xr-x  5 asahi.fuke  staff   160  7 13 10:56 .', '-rw-r--r--  1 asahi.fuke  staff  6148  6 09 12:54 .DS_Store',
              '-rw-r--r--  1 asahi.fuke  staff   540  7 13 10:56 column_test.rb', '-rw-r--r--  1 asahi.fuke  staff  2085  7 13 15:03 ls_test.rb']
    assert_equal output, list.show
  end
end
