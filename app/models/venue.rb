class Venue < ApplicationRecord
  belongs_to :creator, class_name: :User

  validates_uniqueness_of :name

  scope :by_name, -> { order(:name) }
end
