class Job < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :requests, dependent: :destroy
  validates :title, :description, :rate, presence: true
end
