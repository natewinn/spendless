class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	skip_filter :ensure_logged_in, only: [:new, :create]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			"error"
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

	def dashboard
		@user = User.find(params[:id])
		render :show
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit!
	end
end