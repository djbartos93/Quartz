class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['devisekey']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable
  has_one :player
  before_create :build_player
  accepts_nested_attributes_for :player
end
