class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
  end

  # The current_cart starts by getting the :cart_id from the session object,
  # and attempts to find a cart corresponding to this id. If such a Cart record is not found
  # (which will happen if the id is nil or invalid for any reason),
  # then this method will proceed to create a new Cart, store the id of the created cart
  # into the session, and then return the new cart.

  # rescue clauses can be directly placed on the outermost level of a method definition 
  # without needing to enclose the contents in a begin/end block.

end
