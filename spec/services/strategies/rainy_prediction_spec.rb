require 'rails_helper'

RSpec.describe 'Rainy Prediction Strategy' do
  it 'weather prediction is rainy' do
    sun_position = Point.new(x: 0, y: 0)
    vulcanos = Point.new(x: 5, y: 5)
    ferengis = Point.new(x: 8, y: -10)
    betasoides = Point.new(x: -10, y: 5)
    planet_positions = [vulcanos, ferengis, betasoides]
    strategy = Strategies::RainyPrediction.new(planet_positions, sun_position)
    expect(strategy.verify_condition).to eq(true)
    expect(strategy.weather_prediction).to eq(Strategies::RainyPrediction::WEATHER_PREDICTION[:rainy])
  end

  it 'weather prediction is not rainy' do
    sun_position = Point.new(x: 0, y: 0)
    vulcanos = Point.new(x: 10, y: 15)
    ferengis = Point.new(x: 4, y: 5)
    betasoides = Point.new(x: 15, y: -2)
    planet_positions = [vulcanos, ferengis, betasoides]
    strategy = Strategies::RainyPrediction.new(planet_positions, sun_position)
    expect(strategy.verify_condition).to eq(false)
    expect(strategy.weather_prediction).to eq(nil)
  end
end
