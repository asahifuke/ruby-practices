# frozen_string_literal: true

require_relative '../lib/shot'

RSpec.describe Shot do
  it '代表点のテスト' do
    expect(Shot.new(5).mark).to eq 5
  end

  it 'ストライクのテスト' do
    expect(Shot.new('X').mark).to eq 10
  end

  it '最低点のテスト' do
    expect(Shot.new(0).mark).to eq 0
  end
end
