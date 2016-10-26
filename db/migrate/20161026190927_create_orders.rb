class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :cost
      t.datetime :lastdate
      t.references :notification, foreign_key: true

      t.timestamps
    end
  end
end
