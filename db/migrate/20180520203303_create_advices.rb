class CreateAdvices < ActiveRecord::Migration[5.2]
  def change
    create_table :advices do |t|
      t.text :advice
      t.string :category
    end
  end
end
