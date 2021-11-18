class Plush < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
