module Strategies
  class OptimalWeatherPrediction < Strategies::WeatherPrediction
    def verify_condition
      # List<Point> allPositions = new LinkedList<>(planetPositions);
      # allPositions.add(sunPosition);
      # return GeometryUtil.AreAligned(planetPositions) && !GeometryUtil.AreAligned(allPositions);
      all_positions = planet_positions + [sun_position]
      are_aligned?(planet_positions) && !are_aligned?(all_positions)
    end

    # WEATHER_PREDICTION
    def weather_prediction
      WEATHER_PREDICTION[:optimal_weather] if verify_condition
    end

    def weather
      :optimal_weather
    end
  end
end
