class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plushes, foreign_key: 'owner_id'
  has_many :rentals, foreign_key: 'tenant_id'
  # has_many :my_rentals, through: :plushes

  # validates :name, presence: true
  # validates :description, presence: true
end
