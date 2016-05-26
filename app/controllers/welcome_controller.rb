class WelcomeController <ApplicationController

  def index
    @ailments = Ailment.all
    @check_service_area = ServiceArea.new

  end

end 