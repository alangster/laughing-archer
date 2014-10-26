class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new(post: @post)
	end

	def new
		@post = Post.new	
	end

	def create
		@post = Post.new(post_params)
		@post.author = current_user
		if @post.save
			redirect_to @post 
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])		
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		if @post.save
			redirect_to @post
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.delete
		redirect_to current_user
	end

	private

	def post_params
		params.require(:post).permit(:title, :text)
	end

end