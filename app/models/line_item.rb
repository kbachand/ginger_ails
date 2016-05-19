class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :ailment

  def total_price
    ailment.price * quantity
  end
end
