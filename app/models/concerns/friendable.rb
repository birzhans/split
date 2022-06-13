module Friendable
  extend ActiveSupport::Concern

  included do
    has_many :friendship_ones, :class_name => 'Friendship', foreign_key: :friend_one_id
    has_many :friend_twos, through: :friendship_ones
    has_many :friendship_twos, :class_name => 'Friendship', foreign_key: :friend_two_id
    has_many :friend_ones, through: :friendship_twos
  end

  def friends
    friend_ones + friend_twos
  end
end