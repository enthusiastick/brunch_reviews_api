class Review < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  validates_numericality_of :rating, only_integer: true, allow_nil: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
  validates_presence_of :body
end
