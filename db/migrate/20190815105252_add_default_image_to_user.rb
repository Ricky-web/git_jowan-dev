class AddDefaultImageToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :image, :string, default: "default.png"
  end
end
