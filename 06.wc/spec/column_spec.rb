# frozen_string_literal: true

require_relative '../lib/column'

RSpec.describe Column do
  it 'showのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => true, 'w' => true, 'c' => true })
    expect(column.show).to eq '      98     700    4722 ./spec_helper.rb'
  end

  it '-lのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => true, 'w' => false, 'c' => false })
    expect(column.show).to eq '      98 ./spec_helper.rb'
  end

  it '-wのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => false, 'w' => true, 'c' => false })
    expect(column.show).to eq '     700 ./spec_helper.rb'
  end

  it '-cのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => false, 'w' => false, 'c' => true })
    expect(column.show).to eq '    4722 ./spec_helper.rb'
  end

  it '-lwのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => true, 'w' => true, 'c' => false })
    expect(column.show).to eq '      98     700 ./spec_helper.rb'
  end

  it '-lcのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => true, 'w' => false, 'c' => true })
    expect(column.show).to eq '      98    4722 ./spec_helper.rb'
  end

  it '-wcのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => false, 'w' => true, 'c' => true })
    expect(column.show).to eq '     700    4722 ./spec_helper.rb'
  end

  it 'allのテスト' do
    column = Column.new('./spec_helper.rb', { 'l' => false, 'w' => true, 'c' => true })
    expect(column.all).to eq [98, 700, 4722]
  end
end
