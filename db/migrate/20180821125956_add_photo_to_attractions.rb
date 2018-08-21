class AddPhotoToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :photo, :string
  end
end
