class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :nom
      t.string :attraction_type
      t.integer :playersmax
      t.references :user
      t.string :description
      t.integer :price
      t.string :location
      t.timestamps

    end
  end
end
