# frozen_string_literal: true

class Board < ApplicationRecord
  validates :title, presence: true
  validates :condition, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true
  belongs_to :user
  has_one_attached :picture

  def price_in_cents
    (price * 100).to_i
  end
end
