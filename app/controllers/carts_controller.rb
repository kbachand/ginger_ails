class CartsController < ApplicationController
before_action :authenticate_user!
before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json

  def order_complete
    @cart = Cart.find(params[:cart_id])
    @amount = (@cart.subtotal.to_f.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )
      @cart.destroy

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def index
    @carts = Cart.all
  end

  def show
    @user = User.find_by(id: params[:id])  
    # the cart is not secure until we make sure you can only see a cart that matches you as a user
    # may need to drop your database after this is implemented rake db:reset add products and users
      unless current_user.id == @cart.user_id
      flash[:notice] = "You don't have access to that order!"
      redirect_to root_path
      end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /carts/1
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /carts/1
  def destroy
    #make sure we can only destroy our own cart and make sure the session id is also destroyed by setting it to nil
    @cart.destroy if @cart.id == session[:cart_id]
    #session is a rails method that allows us to store temp data without saving it to a dbase
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'You successfully emptied your shopping cart!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
