class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@post = Post.find(params[:post_id])
		@comment.post = @post
		@comment.user = current_user
		if @comment.save
			redirect_to @post
		else
			redirect_to @post
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:text)	
	end

end