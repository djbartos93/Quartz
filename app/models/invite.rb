require 'securerandom'

class Invite < ApplicationRecord
  belongs_to :player
  
  before_create :generate_token

  def generate_token
    token = nil
    loop do
      token = 6.times.map { [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten().sample(random: SecureRandom) }.join
      break if Invite.where(:token => token).empty?
    end
    self.token = token
  end
end
