class Rental < ApplicationRecord
  belongs_to :tenant, class_name: "User"
  belongs_to :plush

  validates :date, presence: true
end
