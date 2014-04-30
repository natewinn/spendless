class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@new_user = User.new
	end

	def show
		@user= User.find(params[:id])
	end

	def create
		if @new_user = User.new(user_params)
			redirect_to users_path
		else
			redirect_to new_user_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			redirect_to edit_user_path
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.delete
		redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :bithday)
	end
end