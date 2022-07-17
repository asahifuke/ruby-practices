# frozen_string_literal: true

require_relative '../lib/ls/list'

RSpec.describe List do
  it 'normalのテスト' do
    list = List.new(['*'], false, false)
    expect(list.show).to eq 'lib   spec   '
  end

  it 'aのテスト' do
    list = List.new(['*', File::FNM_DOTMATCH], false, false)
    expect(list.show).to eq ".           .gitkeep   spec\n.DS_Store   lib        "
  end

  it 'rのテスト' do
    list = List.new(['*'], true, false)
    expect(list.show).to eq 'spec   lib   '
  end

  it 'lのテスト' do
    list = List.new(['*'], false, true)
    expect(list.show).to eq ['total 0', 'drwxr-xr-x  6 asahi.fuke  staff   192 7 16 23:30 lib', 'drwxr-xr-x  7 asahi.fuke  staff   224 7 17 11:39 spec']
  end
end

RSpec.describe List do
  it 'arのテスト' do
    list = List.new(['*', File::FNM_DOTMATCH], true, false)
    expect(list.show).to eq "spec   .gitkeep    .\nlib    .DS_Store   "
  end

  it 'lrのテスト' do
    list = List.new(['*'], true, true)
    expect(list.show).to eq ['total 0', 'drwxr-xr-x  7 asahi.fuke  staff   224 7 17 11:39 spec', 'drwxr-xr-x  6 asahi.fuke  staff   192 7 16 23:30 lib']
  end

  it 'alのテスト' do
    list = List.new(['*', File::FNM_DOTMATCH], false, true)
    output = ['total 16', 'drwxr-xr-x  6 asahi.fuke  staff   192 7 17 11:38 .', '-rw-r--r--  1 asahi.fuke  staff  6148 7 16 22:12 .DS_Store',
              '-rw-r--r--  1 asahi.fuke  staff     0 4 20 12:51 .gitkeep', 'drwxr-xr-x  6 asahi.fuke  staff   192 7 16 23:30 lib',
              'drwxr-xr-x  7 asahi.fuke  staff   224 7 17 11:39 spec']
    expect(list.show).to eq output
  end

  it 'alrのテスト' do
    list = List.new(['*', File::FNM_DOTMATCH], true, true)
    output = ['total 16', 'drwxr-xr-x  7 asahi.fuke  staff   224 7 17 11:39 spec', 'drwxr-xr-x  6 asahi.fuke  staff   192 7 16 23:30 lib',
              '-rw-r--r--  1 asahi.fuke  staff     0 4 20 12:51 .gitkeep', '-rw-r--r--  1 asahi.fuke  staff  6148 7 16 22:12 .DS_Store',
              'drwxr-xr-x  6 asahi.fuke  staff   192 7 17 11:38 .']
    expect(list.show).to eq output
  end
end
