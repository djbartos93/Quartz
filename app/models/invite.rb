require 'securerandom'

class Invite < ApplicationRecord
  belongs_to :user
  
  before_create :generate_token
  after_create :decrement_available_invites

  def generate_token
    token = nil
    loop do
      token = 6.times.map { [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten().sample(random: SecureRandom) }.join
      break if Invite.where(:token => token).empty?
    end
    self.token = token
  end

  def decrement_available_invites
    user.decrement! :available_invites
  end
end
