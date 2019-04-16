module Strategies
  class DroughtPrediction < Strategies::WeatherPrediction
    def verify_condition
      planet_positions << sun_position
      are_aligned?(planet_positions)
    end

    def weather_prediction
      WEATHER_PREDICTION[:drought] if verify_condition
    end

    def weather
      :drought
    end
  end
end
