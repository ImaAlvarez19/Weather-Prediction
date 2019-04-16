module Strategies
  class RainyPrediction < Strategies::WeatherPrediction
    def verify_condition
      # boolean result = true;
      # result = GeometryUtil.IsPointInTheFigure(planetPositions, sunPosition);
      # return result;
      point_in_the_figure?(planet_positions, sun_position)
    end

    def weather_prediction
      WEATHER_PREDICTION[:rainy] if verify_condition
    end

    def weather
      :rainy
    end
  end
end
