class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  # Here we specify the interrelations between line_items and cart:
  # a cart potentially has many associated line items. Each line item contains a reference to its cart's id.

  # :dependent => :destroy part indicates that the existence of line items is dependent on the existence of the cart.
  # If we destroy a cart, deleting it from database, we'll want Rails to destroy any line items that are associated with that cart

  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end
    current_item
  end

  # The method checks whether our list of items already includes the product we are adding; 
  # if it does it bumps (supposed: increases) the quantity and if it does not it builds a new LineItem.

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end

  def total_items
    line_items.sum(:quantity)
  end
end
