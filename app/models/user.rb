class User < ApplicationRecord
  has_many :orders
  has_many :order_items, through: :orders
  has_many :items, through: :order_items


  def self.user_names_for_item_order(item_id)
    joins(:order_items)
    .where("order_items.item_id = ?", item_id)
    .order(:name)
    .distinct
    .pluck(:name)
  end

  def average_order_amount
    orders.average(:amount)
  end

  def item_names_for_order(order_id)
    orders.where(id: order_id)
    .first
    .items
    .pluck(:name)
  end

end
