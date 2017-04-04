class FeedbacksController < ApplicationController

	def index
		@product=Product.all.paginate(:page => params[:page], :per_page => 12)
	end

	def new
		debugger
	@product= Product.find(params[:format])
	@feedback=@product.comment.new

	end


	def create

	end
end
