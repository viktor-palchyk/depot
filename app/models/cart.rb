class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
end

# Here we specify the interrelations between line_items and cart:
# a cart potentially has many associated line items. Each line item contains a reference to its cart's id.

# :dependent => :destroy part indicates that the existence of line items is dependent on the existence of the cart.
# If we destroy a cart, deleting it from database, we'll want Rails to destroy any line items that are associated with that cart
