class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
    create_table :neighborhoods do |t|
      t.string :neighborhood
      t.string :zip_code, array: true
    end
  end
end
