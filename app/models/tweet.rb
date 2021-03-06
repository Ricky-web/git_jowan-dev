class Tweet < ApplicationRecord
  
  belongs_to :user
  has_many :comments
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  [:title, :currency_pair, :images, :text].each do |v|
    validates v, presence: true
  end

end
