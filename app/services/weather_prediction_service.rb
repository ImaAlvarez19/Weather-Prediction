class WeatherPredictionService
  include Modules::Geometry
  attr_reader :planets, :sun_position

  def initialize(planets = nil, sun_position = nil)
    @planets = planets || SolarSystem.instance.planets
    @sun_position = sun_position || SolarSystem.instance.sun_position
  end

  def predict_weather(from_day, to_day)
    max_day_rainy_intensity = 0
    max_perimeter = 0
    totals = { rainy: 0, optimal_weather: 0, drought: 0, normal: 0 }
    (from_day..to_day).each do |day|
      planet_points = get_planet_points(day)
      prediction_day = predict_weather_by_day(day, planet_points)
      totals[prediction_day] += 1
      next if prediction_day != :rainy

      perimeter = calculate_perimeter_from_points(planet_points)
      if perimeter > max_perimeter
        max_perimeter = perimeter
        max_day_rainy_intensity = day
      end
    end
    totals[:rainiest_day] = max_day_rainy_intensity
    totals
  end

  def predict_weather_by_day(day, planet_points = nil)
    planet_points ||= get_planet_points(day)
    weather_manager = PredictionWeatherManager.new(planet_points, sun_position)
    weather_manager.strategy_weather
  end

  def drought_periods(from_day, to_day)
    weather = predict_weather(from_day, to_day)
    { drought: weather[:drought] }
  end

  def optmal_weather_periods(from_day, to_day)
    weather = predict_weather(from_day, to_day)
    { optimal_weather: weather[:optimal_weather] }
  end

  def rainy_periods(from_day, to_day)
    weather = predict_weather(from_day, to_day)
    { rainy: weather[:rainy] }
  end

  def rainiest_day(from_day, to_day)
    weather = predict_weather(from_day, to_day)
    { rainiest_day: weather[:rainiest_day] }
  end

  private

  def get_planet_points(day)
    positions = planets.map do |planet|
      # angle = planet.angular_speed * day
      # angle = planet.angle_position + (planet.angular_speed * day)
      position(planet.sun_distance, planet.angle_day(day))
    end
    positions
  end
end
