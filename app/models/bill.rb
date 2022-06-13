class Bill < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy

  validates :payer_name, :description, :total, presence: true
end
