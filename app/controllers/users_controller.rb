class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create 
		@user = User.new(product_params)
		@user.save
		redirect_to new_product_path
	end

	private 
	def product_params
      params.require(:user).permit(:firstName, :lastName, :patronymic, :phone, :email)
    end
end
