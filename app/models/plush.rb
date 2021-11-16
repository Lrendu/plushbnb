class Plush < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
