class ChangeTypeColumnOnUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :image, :string
  end
  
  def down
    change_column :users, :image, :varchar
  end
  
end
