class Paper < ApplicationRecord
  validates :year, :title, :venue, presence: true
  validates :year, numericality: { only_integer: true }
end
