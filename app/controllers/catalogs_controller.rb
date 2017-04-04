class CatalogsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = Product.sort_and_order_by_category(parameter, sort_column, sort_direction).paginate(:page => params[:page], :per_page => 12)
    @cart = Cart.find(current_cart.id)
    @carousel = Product.last(5)
  end

  private

    def parameter
      params[:where] ||= session[:method]
      session[:method] = params[:where]
      return params[:where]
    end

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
