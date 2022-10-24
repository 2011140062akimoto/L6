class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items 
  
  def balance
    cart_items.inject(0) {|total, item| total += (item.product.price * item.qty) }
  end
end
