# frozen_string_literal: true

require_relative '../lib/shot'

RSpec.describe Shot do
  it '代表点のテスト' do
    expect(Shot.new(5).point).to eq 5
  end

  it 'ストライクのテスト' do
    expect(Shot.new('X').point).to eq 10
  end

  it '最低点のテスト' do
    expect(Shot.new(0).point).to eq 0
  end
end
