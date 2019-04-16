require 'rails_helper'

RSpec.describe 'Weather Prediction Strategy' do
  it 'weather prediction initialize' do
    sun_position = Point.new(x: 0, y: 0)
    vulcanos = Point.new(x: 1, y: 2)
    ferengis = Point.new(x: 8, y: 2)
    betasoides = Point.new(x: -3, y: 2)
    planet_positions = [vulcanos, ferengis, betasoides]
    strategy = Strategies::OptimalWeatherPrediction.new(planet_positions, sun_position)
    expect(strategy.planet_positions.size).to eq(3)
    expect(strategy.sun_position).to eq(sun_position)
  end
end
