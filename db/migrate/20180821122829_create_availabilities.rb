class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.boolean :is_available
      t.date :date
      t.references :attraction, foreign_key: true

      t.timestamps
    end
  end
end
