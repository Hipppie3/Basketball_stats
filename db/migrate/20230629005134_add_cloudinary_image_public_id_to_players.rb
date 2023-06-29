class AddCloudinaryImagePublicIdToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :cloudinary_image_public_id, :string
  end
end
