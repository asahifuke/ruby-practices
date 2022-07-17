# frozen_string_literal: true

require_relative '../lib/ls/column'

RSpec.describe Column do
  let(:column) { Column.new }
  let(:file) { Dir.glob('test1.txt')[0] }

  before do
    `touch test1.txt`
  end

  it 'addのテスト' do
    expect(column.files).not_to include file
    column.add(file)
    expect(column.max_name_size).to eq 9
    expect(column.files).to include file
  end

  it 'showのテスト' do
    expect(column.show(0)).to be_falsey
    column.add(file)
    column.show(0)
    expect(column.show(0)).to eq 'test1.txt'
  end
end
