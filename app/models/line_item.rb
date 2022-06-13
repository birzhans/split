class LineItem < ApplicationRecord
  belongs_to :bill
  belongs_to :user, optional: true

  validates :description, :total, :payer_name, presence: true
end
