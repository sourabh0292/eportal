class CartsController < ApplicationController
  def destroy
    current_cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end
