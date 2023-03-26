class Income < ApplicationRecord
  belongs_to :user
  
  with_options presence: true do
    validates :start_time
    validates :income_price
    validates :genre
    validates :category
  end

  validates :income_price, numericality: { only_integer: true, message: "is invalid. Input half-width characters"}
end

