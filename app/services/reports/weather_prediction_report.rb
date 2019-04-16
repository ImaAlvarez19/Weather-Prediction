module Reports
  class WeatherPredictionReport
    attr_reader :manager, :from_day, :to_day

    def initialize(from_day, to_day)
      @from_day = from_day
      @to_day = to_day
      @manager = WeatherPredictionService.new
    end

    def all_weather_predictions
      manager.predict_weather(from_day, to_day)
    end

    def drought_periods
      manager.drought_periods(from_day, to_day)
    end

    def optmal_weather_periods
      manager.optmal_weather_periods(from_day, to_day)
    end

    def rainy_periods
      manager.rainy_periods(from_day, to_day)
    end

    def rainiest_day
      manager.rainiest_day(from_day, to_day)
    end
  end
end
