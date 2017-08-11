class User < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :received_requests, through: :jobs, source: :requests

  has_many :requests
  validates :first_name, :last_name, :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :avatar, AvatarUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
