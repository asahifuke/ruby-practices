# frozen_string_literal: true

require_relative '../lib/wc/row'

RSpec.describe Row do
  it '-lのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => false, 'c' => false })
    expect(row.show).to eq '      16 '
  end

  it '-wのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => false })
    expect(row.show).to eq '    1513 '
  end

  it '-cのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => false, 'c' => true })
    expect(row.show).to eq '    1513 '
  end

  it '-lwのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => true, 'c' => false })
    expect(row.show).to eq '      16    1513 '
  end

  it '-lcのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => false, 'c' => true })
    expect(row.show).to eq '      16    1513 '
  end

  it '-wcのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => true })
    expect(row.show).to eq '    1513    1513 '
  end
end

RSpec.describe Row do
  it 'showのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => true, 'c' => true })
    expect(row.show).to eq '      16    1513    1513 '
  end

  it 'allのテスト' do
    row = Row.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => true })
    expect(row.all).to eq [16, 1513, 1513]
  end
end
