class Player < ApplicationRecord
  validates_uniqueness_of :uuid
  belongs_to :user

  validates :uuid, presence: true, on: :update
end
