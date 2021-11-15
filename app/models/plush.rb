class Plush < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
