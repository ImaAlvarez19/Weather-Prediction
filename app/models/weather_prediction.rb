class WeatherPrediction < ApplicationRecord
  validates :day, :weather, presence: true
end
