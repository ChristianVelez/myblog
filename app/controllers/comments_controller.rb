class CommentsController < ApplicationController
	 before_filter :authenticate_user! 
	

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:name, :body)) 

		redirect_to post_path(@post)	
		
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:post).permit(:title, :body)
	end
end

