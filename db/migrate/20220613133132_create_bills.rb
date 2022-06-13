class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.belongs_to :user, foreign_key: true
      t.string :payer_name, null: false
      t.string :description, null: false
      t.integer :total, null: false

      t.timestamps
    end
  end
end
