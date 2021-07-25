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

end
