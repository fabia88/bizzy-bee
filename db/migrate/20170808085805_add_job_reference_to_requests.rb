class AddJobReferenceToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :job, foreign_key: true
  end
end
