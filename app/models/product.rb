class Product < ApplicationRecord
  before_validation {name.strip!}
  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
end
