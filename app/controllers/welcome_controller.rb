class WelcomeController <ApplicationController

  def index
    @ailments = Ailment.all
  end

end 