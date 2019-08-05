class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:nickname]
  
  validates :nickname, 
  presence: true, uniqueness: true, 
  length: {maximum: 8}, format: { with: /\A[a-z0-9]+\z/i }
         
  has_many :tweets
  
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
