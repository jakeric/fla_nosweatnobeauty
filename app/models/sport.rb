class Sport < ApplicationRecord
  has_many :sportactions
  has_many :sports, :through => :actions
  has_many :employees, :through => :actions

  validates :sportname, presence: true
  validates :pointsperaction, presence: true
end
