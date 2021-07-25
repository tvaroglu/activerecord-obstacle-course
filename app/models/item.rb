class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items


  def self.item_names
    pluck(:name)
  end

  def self.order_item_names
    joins(:orders)
    .order(name: :asc)
    .pluck(:name)
  end

  def self.items_except_for(items_array)
    where.not(id: items_array.pluck(:id))
  end

  def self.ordered_items
    joins(:order_items)
    # .where.not(order_items: { item_id: nil })
    .order(:name)
    .distinct
  end

  def self.ordered_item_names
    ordered_items.pluck(:name)
  end

end
