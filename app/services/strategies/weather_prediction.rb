module Strategies
  class WeatherPrediction
    include Modules::Geometry
    attr_reader :planet_positions, :sun_position
    WEATHER_PREDICTION = { drought: 'Drought', rainy: 'Rainy',
                           optimal_weather: 'Optimal Weather',
                           normal: 'Normal' }.freeze

    def initialize(planet_positions, sun_position)
      @planet_positions = planet_positions
      @sun_position = sun_position
    end

    # boolean
    def verify_condition; end

    # WeatherState
    def weather_prediction; end
  end
end
