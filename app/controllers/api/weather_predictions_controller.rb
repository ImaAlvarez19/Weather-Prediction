module Api
  class WeatherPredictionsController < ActionController::API
    def day_weather
      errors = validate_day_params
      return render json: { errors: errors, status: :bad_request }, status: :bad_request if errors.any?

      day = permited_params[:day]
      weather_prediction = WeatherPredictionService.new.predict_weather_by_day(day.to_i)
      response = { status: :ok, day: day, weather: weather_prediction }

      render json: response
    end

    private

    def validate_day_params
      errors = {}
      errors[:day] = 'required parameter' if permited_params[:day].blank?
      errors
    end

    def permited_params
      params.permit(:day)
    end
  end
end
