class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_by_ids(table, id_array)
    table.where(id: id_array)
  end

end
