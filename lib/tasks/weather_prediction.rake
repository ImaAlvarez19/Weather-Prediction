namespace :weather_prediction do
  task load_ten_years: :environment do
    (0..3600).each do |day|
      weather = WeatherPredictionService.new.predict_weather_by_day(day)
      WeatherPrediction.create(day: day, weather: weather)
    end
  end
end
