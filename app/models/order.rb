class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items


  def self.orders_of_amount(x)
    where(amount: x)
  end

  def self.orders_of_amounts(x, y)
    where(amount: [x, y])
  end

  def self.orders_in_amount_range(x, y)
    where(amount: x..y)
  end

  def self.orders_less_than(x)
    where("amount < ?", x)
  end

  def self.smallest_order_id
    order(:amount)
    .first
    .id
  end

  def self.largest_order_id
    order(amount: :desc)
    .first
    .id
  end

end
