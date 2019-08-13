class AddTitleToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :title, :string, after: :user_id
  end
end
