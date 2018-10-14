class Player < ApplicationRecord
  validates_uniqueness_of :uuid
  belongs_to :user
  has_many :invites
end
