class AddImageUrlToAttraction < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :image_url, :string
  end
end
