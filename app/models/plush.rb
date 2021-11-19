class Plush < ApplicationRecord
  AUTHORIZED_COLORS = %w[Green White Yellow Red Blue Grey Brown Black].sort
  AUTHORIZED_SIZES = %w[Small Medium Large]

  include PgSearch::Model

  belongs_to :owner, class_name: "User"
  has_many :rentals
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
