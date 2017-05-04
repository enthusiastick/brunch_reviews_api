class Venue < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :reviews
  has_many :users, through: :reviews

  validates_uniqueness_of :name

  scope :by_name, -> { order(:name) }
end
