require 'rails_helper'

RSpec.describe 'Drought Prediction Strategy' do
  it 'weather prediction is drought' do
    sun_position = Point.new(x: 0, y: 0)
    vulcanos = Point.new(x: -2, y: -2)
    ferengis = Point.new(x: -4, y: -4)
    betasoides = Point.new(x: 8, y: 8)
    planet_positions = [vulcanos, ferengis, betasoides]
    strategy = Strategies::DroughtPrediction.new(planet_positions, sun_position)
    expect(strategy.verify_condition).to eq(true)
    expect(strategy.weather_prediction).to eq(Strategies::DroughtPrediction::WEATHER_PREDICTION[:drought])
  end

  it 'weather prediction is not drought' do
    sun_position = Point.new(x: 0, y: 0)
    vulcanos = Point.new(x: -2, y: -2)
    ferengis = Point.new(x: -4, y: -6)
    betasoides = Point.new(x: 8, y: 8)
    planet_positions = [vulcanos, ferengis, betasoides]
    strategy = Strategies::DroughtPrediction.new(planet_positions, sun_position)
    expect(strategy.verify_condition).to eq(false)
    expect(strategy.weather_prediction).to eq(nil)
  end
end
