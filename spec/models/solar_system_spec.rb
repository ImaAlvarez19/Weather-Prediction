require 'rails_helper'

RSpec.describe SolarSystem, type: :model do
  let(:solar_system) { SolarSystem.instance }

  it 'initialize Solar System' do
    expect(solar_system.planets.size).to eq(3)
    expect(solar_system.sun_position.class.name).to eq('Point')
    expect(SolarSystem::DAYS_YEAR).to eq(360)
  end
end
