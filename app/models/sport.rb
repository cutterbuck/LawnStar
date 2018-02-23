class Sport < ApplicationRecord
  has_many :games
  validates :name, :rules, presence: true
end
