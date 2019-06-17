class Cart < ApplicationRecord
  has_many :line_items

  def product_ids
    self.line_items.map(&:product_id)
  end

  def total_quantity
    self.line_items.sum(&:quantity)
  end
end
