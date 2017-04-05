class OrdersController < ApplicationController
  before_action :non_empty_cart, except: :show
  def new
    @order = Order.new
  end

  def create
    @cart = current_cart
    @order = current_user.orders.build(params.require(:order).permit(:name, :address, :pincode, :mobile,:user_id))
    #@order.price = @cart.price
    #product = []
    #@cart.line_items.each {|item| product << {product_id: item.product.id, quantity: item.quantity}}
    #@order.product = product.to_json
    
    if @order.save
      @cart.destroy
      session[:cart_id] = nil
      redirect_to order_path(@order)
    else
      flash[:notice] = "Error"
      redirect_to catalogs_index_path
    end
  end

  def show
  end

  private
    def non_empty_cart
      redirect_to root_path if current_cart.line_items.count == 0
    end
end
