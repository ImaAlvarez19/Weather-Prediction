require 'rails_helper'

RSpec.describe WeatherPrediction, type: :model do
  let(:weather_prediction) { WeatherPrediction.new(day: 1, weather: 'Rainy') }
  it 'initialize Weather Prediction' do
    expect(weather_prediction.day).to eq(1)
    expect(weather_prediction.weather).to eq(Strategies::WeatherPrediction::WEATHER_PREDICTION[:rainy])
  end
end
