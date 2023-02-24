class UserController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def show
    @user = current_user
    @products_sell = current_user.products
    @products_bought = Product.all.where(buyer_id: current_user.id)
  end
end
