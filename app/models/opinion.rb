class Opinion < ApplicationRecord
  [:text, :user_id].each do |v|
    validates v, presence: true
  end
  
end
