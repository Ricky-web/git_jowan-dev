class ChangeImageColumnOnUser < ActiveRecord::Migration[5.2]
  def up
    change_column_null :users, :image, false, "default.png"
    change_column :users, :image, :string, default: "default.png"
  end
  
  def down
    change_column_null :users, :image, true, "default.png"
    change_column :users, :image, :string, default: "default.png"
  end
end
