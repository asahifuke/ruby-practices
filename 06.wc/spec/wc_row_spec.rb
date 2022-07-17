# frozen_string_literal: true

require_relative '../lib/wc/row'

RSpec.describe Row do
  it 'showのテスト' do
    rows = Row.new({ 'l' => true, 'w' => true, 'c' => true })
    expect(rows.show).to eq ['      10      33     265 ./spec/wc_row_spec.rb']
  end
end
