class UsersController < ApplicationController

	before_action :require_logged_in, except: [:new, :create, :home]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
	  		session[:user_id] = @user.id
	  	  	redirect_to user_path(@user)
	  	else
	  		redirect_to '/'
	  	end
	end

	def show
		@user = User.find(params[:id])
		@message = flash[:notice]
	end

private

	def user_params
      params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end

end