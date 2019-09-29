class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true, uniqueness: true , length:{ minimum: 2, maximum: 20}
  
  validates :introduction, length: { maximum: 50 }       

  has_many :books, dependent: :destroy
  attachment :profile_image

  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
     where(conditions).where(["name = :value", { :value => name }]).first
    else
       where(conditions).first
    end
  end
end
