class Api::V1::UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
		render json: {message: 'successfully created', data: @user, status_code: 201}
		else
		render json: {message: 'failure', data: @user.errors, status_code: 422}
		end
	end

	def index
		@users=User.all
		render json: {message: 'successfully listed', data: @users, status_code: 200}
	end

	
	def update
		@user=User.find_by_user_name(params[:user_name])
		@user.update_attributes(user_params)
		if render json: {message: 'successfully updated', data: @user, status_code: 200}
		else
		render json: {message: 'failure', data: @user.errors, status_code: 422}
		end
	end

	def show
		# binding.pry
		@user=User.find(params[:id])
		render json: {message: 'successfully showed', data: @user, status_code: 200}
	end


	def search_by_name
		@user=User.find_by_user_name(params[:user_name])
		render json: {message: 'successfully showed', data: @user, status_code: 200}

	end

	def destroy
		@user=User.find_by_user_name(params[:user_name])
		@user.destroy
		render json: {message: 'successfully deleted', data: @user, status_code: 200}
	end


	private

		def user_params
			params.require(:user).permit(:user_name,:user_age,:user_role,:user_gender)
		end
end