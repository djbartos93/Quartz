class User < ApplicationRecord
  devise :two_factor_authenticatable,
          #DO NOT DO NOT DO NOT put a key in here, always save to an env variable
         :otp_secret_encryption_key => ENV['devisekey']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :lockable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable
  has_one :player
  before_create :build_player
  accepts_nested_attributes_for :player

  has_many :invites # active invites
  # the users this user invited and the user that invited this user
  has_many :users, :class_name => "User", :foreign_key => "invited_by_user_id"
  belongs_to :user, :class_name => "User", :foreign_key => "invited_by_user_id", optional: true

  #adds deactivated method to devise
  def active_for_authentication?
    super && !deactivated
  end

  def inactive_message
    !deactivated ? super : :special_condition_is_not_valid
  end
end
