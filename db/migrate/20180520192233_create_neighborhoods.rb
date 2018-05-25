class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def up
    create_table :neighborhoods do |t|
      t.string :neighborhood
      t.string :zip_code, array: true
    end
  end

  def down
    drop_table :neighborhoods
  end
end
