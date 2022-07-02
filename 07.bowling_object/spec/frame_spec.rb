# frozen_string_literal: true

require_relative '../lib/frame'
require_relative '../lib/shot'

RSpec.describe Frame do
  let(:strike) { Shot.new('X') }
  let(:zero) { Shot.new(0) }
  let(:two) { Shot.new(2) }
  let(:three) { Shot.new(3) }
  let(:eight) { Shot.new(8) }
  let(:strike_frame) { Frame.new(strike, strike, strike) }
  let(:spare_frame) { Frame.new(two, eight, strike) }
  let(:usual_frame) { Frame.new(three, three, zero) }

  it '最後のフレームでストライク' do
    expect(strike_frame.sum).to eq 30
  end

  it '最後のフレーム以外でストライク' do
    expect(spare_frame.sum).to eq 20
  end

  it 'ストライク以外' do
    expect(usual_frame.sum).to eq 6
  end
end
