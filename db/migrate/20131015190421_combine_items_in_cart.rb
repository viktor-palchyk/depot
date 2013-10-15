class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # Count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      # We get a sum of the quantity fields for each of the line items associated with this cart, 
      # grouped by product_id. The resulting sums will be a list of ordered pairs of product_ids and quantity.

      sums.each do |product_id, quantity|
        # We iterate over these sums, extracting the product_id and quantity from each.

        if quantity > 1
          # remove individual items
          cart.line_items.where(:product_id => product_id).delete_all

          # replace with a single item
          cart.line_items.create(:product_id => product_id, :quantity => quantity)

          # In cases where the quantity is greater than one, we will delete all of the individual line items
          # associated with this cart and this product, and replace them with a single line item
          # with the correct quantity.

        end
      end
    end
  end

  def self.down
    # split items with quantity > 1 into multiple items
    LineItem.where("quantity>1").each do |lineitem|
      # add individual items
      lineitem.quantity.times do
        LineItem.create :cart_id => lineitem.cart_id,
        :product_id => lineitem.product_id, :quantity => 1
      end

      # remove original item 
      lineitem.destroy
    end
  end
end
