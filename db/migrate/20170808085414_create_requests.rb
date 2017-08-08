class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.date :date
      t.string :status
      t.integer :duration
      t.integer :total_price

      t.timestamps
    end
  end
end
