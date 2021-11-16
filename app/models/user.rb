class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plushes
  has_many :rentals

  validates :name, presence: true
  validates :description, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
