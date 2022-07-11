# frozen_string_literal: true

require_relative '../lib/row'

RSpec.describe Row do
  it 'showのテスト' do
    rows = Row.new({ 'l' => true, 'w' => true, 'c' => true })
    expect(rows.show).to eq ['       8      27     218 row_spec.rb']
  end
end
