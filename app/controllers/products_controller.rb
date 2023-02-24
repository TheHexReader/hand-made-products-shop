class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(permited_params.merge(buyer_id: nil))
    if @product.save
      redirect_to profile_path
      flash[:notice] = t('success')
    else
      redirect_to root_path
      flash[:notice] = t('failure')
    end
  end

  def destroy
    @product = current_user.products.find_by(id: params[:id])
    if @product.destroy
      redirect_to profile_path
      flash[:notice] = t('success')
    else
      redirect_to root_path
      flash[:notice] = t('failure')
    end
  end

  def buy
    @product = Product.find_by(id: params[:id])
    
    unless @product.buyer_id.nil?
      redirect_to root_path
      flash[:notice] = t('already_bought')
      return
    end

    if @product.update(buyer_id: current_user.id)
      redirect_to profile_path
      flash[:notice] = t('success')
    else
      redirect_to root_path
      flash[:notice] = t('failure')
    end
  end

  protected

  def permited_params
    params.require(:product).permit(:title, :description, :cost, :image)
  end
end
