class Paper < ApplicationRecord
  has_and_belongs_to_many :authors

  validates :year, :title, :venue, presence: true
  validates :year, numericality: { only_integer: true }

  scope :written_in, ->(year) { where("year == ?", year) }

  def authors_names
    names = ""
    authors.each do |author|
      names += author.name + " "
    end
    names
  end
end
