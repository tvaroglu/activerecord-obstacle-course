class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items

  def orders_of_user(user_id)
    orders.where(user_id: user_id)
  end

end
