class SessionsController < ApplicationController
  def main
    session[:cart_id] = SecureRandom.uuid
  end
end
