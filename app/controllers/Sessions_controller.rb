class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.password == params[:password]
			session[:id] = user.id
			redirect_to :root
		else
			render "users/new"
		end
	end

	def destroy
		session[:id] = nil
		redirect_to :root
	end

end