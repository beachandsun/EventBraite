class User < ApplicationRecord
  has_one_attached :picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :events
	has_many :attendances
	has_many :events, through: :attendances

	validates :email, presence: true
	#validates :encrypted_password, presence: true


	after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


end