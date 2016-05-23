class LineItemsController < ApplicationController
	include CurrentCart
	before_action :authenticate_user!
	before_action :set_cart, only: [:create]
    before_action :set_line_item, only: [:index]

	def index
		@line_item = LineItem.all
	end

	def create
		ailment = Ailment.find(params[:ailment_id])
		@line_item = @cart.add_ailment(ailment.id)
		respond_to do |format|
		  if @line_item.save
			format.html {redirect_to @line_item.cart}
		  else
			format.html {render :new}
		  end
        end
	end

def new
	@line_item = LineItem.new
end

private

  def set_line_item
	@line_item = LineItem.find(params[:id])
  end

  def line_item_params
	params.require(:line_item).permit(:ailment_id, :quantity, :cart_id)
  end

end