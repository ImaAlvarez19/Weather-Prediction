require 'rails_helper'

RSpec.describe Point, type: :model do
  let(:point) { Point.new(x: 1, y: 2) }

  it 'initialize point with coordinates' do
    expect(point.x).to eq(1)
    expect(point.y).to eq(2)
  end
end
