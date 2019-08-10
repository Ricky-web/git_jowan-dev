class MyValidator < ActiveModel::Validator
  def validate(record)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:nickname]
         
  has_many :tweets
  
  validates :nickname, 
  presence: true, uniqueness: true, 
  length: {maximum: 8}, format: { with: /\A[a-z0-9]+\z/i }
  
  validates :age,
  numericality: {only_integer: true}
  
  def changed_profile?(update_params)
    self.attributes = update_params
    
    if self.changed? && self.valid?
      true
    else
      false
    end
  end
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  def will_save_change_to_email?
    false
  end
  
end
