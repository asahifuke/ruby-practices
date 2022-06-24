# frozen_string_literal: true

require_relative '../lib/game'

RSpec.describe Game do
  it 'スコアが139' do
    expect(Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5').sum).to eq 139
  end

  it 'スコアが164' do
    expect(Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X').sum).to eq 164
  end

  it 'スコアが107' do
    expect(Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4').sum).to eq 107
  end

  it 'スコアが134' do
    expect(Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0').sum).to eq 134
  end

  it 'スコアが144' do
    expect(Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,1,8').sum).to eq 144
  end

  it 'スコアが300' do
    expect(Game.new('X,X,X,X,X,X,X,X,X,X,X,X').sum).to eq 300
  end
end
