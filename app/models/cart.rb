class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def count
  	line_items.count
  end
end
