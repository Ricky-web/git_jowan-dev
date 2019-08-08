class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer, :after => :nickname
    add_column :users, :gender, :string, :after => :age
    add_column :users, :nationality, :string, :after => :gender
    add_column :users, :self_introduction, :text, :after => :nationality
  end
end
