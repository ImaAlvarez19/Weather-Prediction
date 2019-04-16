class CreateWeatherPredictions < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_predictions do |t|
      t.integer :day
      t.string :weather

      t.timestamps
    end
  end
end
