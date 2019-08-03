class AddCurrencyPairToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :currency_pair, :string
  end
end
