class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items


  def self.total_sales
    sum(:amount)
  end

  def self.total_sales_excluding_user(user_id)
    where.not(user_id: user_id)
    .sum(:amount)
  end

  def self.average_amount
    average(:amount)
  end

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

  def self.orders_by_amount(sort_key = :asc)
    order(amount: sort_key)
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

  def self.orders_that_include_item(item_id)
    joins(:order_items)
    .where("order_items.item_id = ?", item_id)
    .distinct
  end

  def self.orders_for_user_by_item(user_id, item_id)
    joins(:order_items)
    .where(user_id: user_id)
    .where("order_items.item_id = ?", item_id)
    .distinct
  end

  def items_by_name
    items.order(:name)
  end

  def item_names_for_order
    items.pluck(:name)
  end

end
