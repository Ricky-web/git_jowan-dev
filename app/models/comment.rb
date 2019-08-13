class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  
  [:text, :tweet_id, :user_id].each do |v|
    validates v, presence: true
  end
end
