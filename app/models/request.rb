class Request < ApplicationRecord
  belongs_to :job
  belongs_to :user
  validates :date, presence: true, uniqueness: { scope: :job_id }
  validates :duration, presence: true

  def cancelled?
    self.status == "Cancelled"
  end

  def denied?
    self.status == "Denied"
  end

  def confirmed?
    self.status == "Confirmed"
  end
end
