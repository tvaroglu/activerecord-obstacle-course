class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items


  # def self.items_by_id(id_array)
  #   where(id: id_array)
  # end

end
