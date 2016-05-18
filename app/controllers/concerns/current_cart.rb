# Create a session to hold an existing object, create a module. A module doesn't create an instance of itself
#Just for functionality, similar to set method.  Uses a session method, stores info to a session without storing it to a database. As long as user is in a session it will keep this information. Rails works with browser to store information. Related to cookies and caches. If session exist we need to create a cart.
module CurrentCart
private

def set_cart
	@cart = Cart.find(session[:cart_id])

rescue ActiveRecord::RecordNotFound
# rescue antcipates the error that would be thrown if there is not cart_id, don't stop create a cart and give it the current user then start the session as this cart_id
	@cart = Cart.create(user: current_user)
	session[:cart_id] = @cart.id

end

end