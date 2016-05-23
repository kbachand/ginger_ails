class ServiceAreasController < ApplicationController
  
  def create
  	@check_service_area = ServiceArea.new(service_area_params)
  	respond_to do |format|
      if @check_service_area.save
        format.html { redirect_to @check_service_area }
      else
        format.html { render :new }
      end
    end
  end

  def new
  	@check_service_area = ServiceArea.new
  end

  def index
  end

  def show
  	@check_service_area = ServiceArea.find(params[:id])
  end

private
  def service_area_params
	params.require(:service_area).permit(:address, :latitude, :longitude)
  end
end
