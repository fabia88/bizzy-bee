class User < ApplicationRecord
  has_many :jobs
  has_many :requests
  validates :first_name, :last_name, :address, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
end
