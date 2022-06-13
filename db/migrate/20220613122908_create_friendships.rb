class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :friend_one, null: false, foreign_key: { to_table: :users }
      t.belongs_to :friend_two, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :friendships, [:friend_one_id, :friend_two_id], unique: true
  end
end
