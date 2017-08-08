class Job < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :requests
  validates :title, :description, :rate, presence: true
end
