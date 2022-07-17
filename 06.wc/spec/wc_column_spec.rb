# frozen_string_literal: true

require_relative '../lib/wc/column'

RSpec.describe Column do
  it '-lのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => false, 'c' => false })
    expect(column.show).to eq '      16 '
  end

  it '-wのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => false })
    expect(column.show).to eq '    1513 '
  end

  it '-cのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => false, 'c' => true })
    expect(column.show).to eq '    1513 '
  end

  it '-lwのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => true, 'c' => false })
    expect(column.show).to eq '      16    1513 '
  end

  it '-lcのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => false, 'c' => true })
    expect(column.show).to eq '      16    1513 '
  end

  it '-wcのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => true })
    expect(column.show).to eq '    1513    1513 '
  end
end

RSpec.describe Column do
  it 'showのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => true, 'w' => true, 'c' => true })
    expect(column.show).to eq '      16    1513    1513 '
  end

  it 'allのテスト' do
    column = Column.new(texts: './spec_helper.rb', options: { 'l' => false, 'w' => true, 'c' => true })
    expect(column.all).to eq [16, 1513, 1513]
  end
end
