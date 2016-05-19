class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  def add_ailment(ailment_id)
	# grabbing line_items through association setting the current_item to the product_id 
  current_item = line_items.find_by(ailment_id: ailment_id)
  #if there is a value in here then it knows its in the cart
  if current_item
 	current_item.quantity += 1
  else
 	current_item = line_items.build(ailment_id: ailment_id)
  end
  #regardless of which path we want to retun the current item, ruby returns the last thing
  current_item
 end

  def subtotal
    line_items.to_a.sum{ |item| item.total_price }
  end

end
