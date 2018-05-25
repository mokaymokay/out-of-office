class CreateAdvices < ActiveRecord::Migration[5.2]
  def up
    create_table :advices do |t|
      t.text :advice
      t.string :category
    end
  end

  def down
    drop_table :advices
  end
end
