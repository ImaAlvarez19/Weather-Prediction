require 'rails_helper'

RSpec.describe Planet, type: :model do
  let(:planet) { Planet.new(angular_speed: -1.0, sun_distance: 0.0, angle_position: 500.0) }

  it 'initialize planet' do
    expect(planet.angular_speed).to eq(-1.0)
    expect(planet.sun_distance).to eq(0)
    expect(planet.angle_position).to eq(500)
  end
end
