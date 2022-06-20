class Bill < ApplicationRecord
  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy

  validates :payer_name, :description, :total, presence: true

  accepts_nested_attributes_for :line_items, allow_destroy: true, reject_if: :all_blank
end
