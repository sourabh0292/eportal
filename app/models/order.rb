class Order < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :address, :pincode, :mobile

  def self.amount(parameters)
    if parameters[:start_date] and parameters[:end_date]
      where("created_at >= :start_date AND created_at <= :end_date",
          {start_date: parameters[:start_date], end_date: parameters[:end_date]})
    else
      all
    end
  end
end
