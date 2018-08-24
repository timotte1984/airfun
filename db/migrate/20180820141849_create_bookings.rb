class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :description
      t.date :start_date
      t.date :end_date
      t.string :place
      t.references :attraction, foreign_key: true
      t.boolean :is_validated
      t.boolean :is_paid
      t.timestamps
    end
  end
end
