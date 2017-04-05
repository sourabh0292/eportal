class FeedbacksController < ApplicationController

	def index
		@product=Product.all.paginate(:page => params[:page], :per_page => 12)
	end

	def new

	@product= Product.find(params[:format])
	@feedback=@product.comments.new


	end


	def create
		feedback = Comment.new(params.require(:comment).permit(:feedback, :product_id))	
		if feedback.save
			redirect_to feedbacks_path
			else
			redirect_to new_feedback_path(feedback.product_id)	
		end
	end

		def destroy
		@feedback = Comment.find(params[:id])
		@feedback.destroy
		redirect_to feedbacks_path

		end


	
end
