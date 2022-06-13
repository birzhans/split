class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :bill, null: false, foreign_key: true
      t.string :description, null: false
      t.string :total, null: false
      t.belongs_to :user, foreign_key: true
      t.string :payer_name, null: false

      t.timestamps
    end
  end
end
