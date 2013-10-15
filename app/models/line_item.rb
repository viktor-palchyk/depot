class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end
  
end

# We specify links from the line item to the carts and products tables
# belongs_to tells Rails that rows in the line_items table are children of rows in the carts and products tables.
# No line item can exist unless the corresponding cart and product rows exist.
# This declarations add navigation capabilities to the model objects. 
# Because we added the belongs_to we can retrieve LineItem's Product and display the book's title, like this:

# li = LineItem.find(...)
# puts "This line item is for #{li.product.title}"

# And because Cart is declared to have many line items, we can reference them from a cart object:

# cart = Cart.find(...)
# puts "This cart has #{cart.line_items.count} line items."