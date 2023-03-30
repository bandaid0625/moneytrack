class Spending < ApplicationRecord
  belongs_to :user

  def income?
    false
  end
  
  with_options presence: true do
    validates :start_time
    validates :spending_price
    validates :genre
    validates :category
  end

  validates :spending_price, numericality: { only_integer: true, message: "is invalid. Input half-width characters"}
end


