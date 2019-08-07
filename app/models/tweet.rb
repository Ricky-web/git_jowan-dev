class Tweet < ApplicationRecord
  
  belongs_to :user
  has_many_attached :images
  
  [:currency_pair, :images, :text].each do |v|
    validates v, presence: true
  end

end
