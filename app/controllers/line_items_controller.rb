class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @cart = current_cart
    @line_item = @cart.line_items.find_by(product: product)
    if @line_item
      @line_item.quantity += 1
      flash[:notice] = "Cart Updated"
    else
      @line_item = @cart.line_items.build(product: product)
      @line_item.quantity = 1
      flash[:notice] = "Product Added To Cart"
    end
    @line_item.save
    @cart.price += @line_item.product.price
    @cart.save
    redirect_to root_path
  end

  def destroy
    @cart = current_cart
    @line_item = @cart.line_items.find(params[:id])
    @line_item.destroy
    redirect_to root_path
  end
end
