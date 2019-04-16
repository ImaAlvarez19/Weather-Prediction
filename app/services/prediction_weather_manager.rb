class PredictionWeatherManager
  attr_reader :strategies

  def initialize(planets_points, sun_position)
    @strategies = []
    strategies << Strategies::DroughtPrediction.new(planets_points, sun_position)
    strategies << Strategies::RainyPrediction.new(planets_points, sun_position)
    strategies << Strategies::OptimalWeatherPrediction.new(planets_points, sun_position)
  end

  def strategy_weather
    strategy = strategies.detect(&:verify_condition)
    strategy.present? ? strategy.weather : :normal
  end
end
