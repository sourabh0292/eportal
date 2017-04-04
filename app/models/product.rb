class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :line_items
  has_many :comments

  scope :sort_and_order_by_category, -> (parameter, sort_column, sort_direction) { sort_by(parameter).order(sort_column+ " " + sort_direction)}


  def self.sort_by(search)
    if search and search != 'All'
      where(category: search)
    else
      all
    end
  end
end
