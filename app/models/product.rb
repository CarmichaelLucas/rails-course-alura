class Product < ApplicationRecord

  belongs_to :department, optional: true

  validates :price, presence: true
  validates :name, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
  validates :quantity, presence: true, length: { minimum: 1 }
end
