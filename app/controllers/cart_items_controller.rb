class CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
    @product = Product.find(params[:product_id])
  end
  
  def create
    @product = Product.find(params[:cart_item][:product_id])
    @cart_item = CartItem.new(product_id: params[:cart_item][:product_id], cart_id: params[:cart_item][:cart_id], qty: params[:cart_item][:qty])
    p params[:product_id]
    if @cart_item.save
      redirect_to root_path
    else
      render new_cart_item_path
    end
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private
  
  def cart_item_params
    params.permit(:qty, :product_id, :cart_id)
  end
end
