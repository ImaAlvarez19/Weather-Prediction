Rails.application.routes.draw do
  namespace :api do
    resources :weather_predictions do
      get :day_weather, on: :collection
    end
  end
end
