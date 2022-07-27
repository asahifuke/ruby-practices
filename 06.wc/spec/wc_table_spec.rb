# frozen_string_literal: true

require_relative '../lib/wc/table'

RSpec.describe Table do
  it 'showのテスト' do
    table = Table.new({ 'l' => true, 'w' => true, 'c' => true })
    expect(table.show).to eq ['      10      33     275 ./spec/wc_table_spec.rb']
  end
end
