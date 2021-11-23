class Paper < ApplicationRecord
  validates :year, :title, :venue, presence: true
end
