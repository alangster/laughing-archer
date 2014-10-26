class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])	
		@posts = @user.posts
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to @user 
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end