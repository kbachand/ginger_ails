class AilmentsController <ApplicationController

  def show
     @selected_ailment = Ailment.find(params[:id])
     @review = Review.new
     @reviews = @selected_ailment.reviews.order('created_at DESC')
  end

def create
  @ailment = Ailment.new(ailment_params)
end


private

def ailment_params
  params.require(:ailment).permit(:name, :description, :shopping_list)
end

end 