class ProductsController < ApplicationController
  def index
    session[:id] = SecureRandom.uuid
    @products = Product.all.order(created_at: :DESC)
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render new_product_path
    end
  end
  
  def destory
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root
    else
      redirect_to root
    end
  end
  
  private
  
  def product_params
    p params
    params.permit(:name, :price)
  end
end
