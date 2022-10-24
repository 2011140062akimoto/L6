class CartsController < ApplicationController
  def show
    @cart = current_cart
    @balance = @cart.balance
  end
end
