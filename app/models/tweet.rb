class Tweet < ApplicationRecord
  
  belongs_to :user
  has_many :comments
  has_many_attached :images
  
  [:title, :currency_pair, :images, :text].each do |v|
    validates v, presence: true
  end

end
