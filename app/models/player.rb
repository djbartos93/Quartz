class Player < ApplicationRecord
  belongs_to :user
  has_many :invites
end
