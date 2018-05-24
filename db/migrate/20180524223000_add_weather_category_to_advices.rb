class AddWeatherCategoryToAdvices < ActiveRecord::Migration[5.2]
  def change
    add_column :advices, :weather_category, :string
  end
end
