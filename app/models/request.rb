class Request < ApplicationRecord
  belongs_to :job
  belongs_to :user
  validates :date, presence: true, uniqueness: { scope: :job_id }
  validates :duration, presence: true
end
