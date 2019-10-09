class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true
  validates :email, presence: true 

  has_many :user_jobs, dependent: :destroy
  has_many :jobs, through: :user_jobs

  has_many :user_lessons, dependent: :destroy
  has_many :lessons, through: :user_lessons

  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.image
      user.name =  auth.info.name
      end 
  end  

  private 

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end 

end 
