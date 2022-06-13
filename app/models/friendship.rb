class Friendship < ApplicationRecord
  belongs_to :friend_one, class_name: 'User'
  belongs_to :friend_two, class_name: 'User'

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :friend_one_id, uniqueness: { scope: :friend_two_id }

  def self.search(first_id, second_id)
    Friendship.find_by_sql([
      'select id from friendships where friend_one_id in (?, ?) and friend_two_id in (?, ?)',
      first_id, second_id, first_id, second_id
    ]).first
  end
end
