class Product < ActiveRecord::Base
  
  scope :order, -> { where(order: 'title') }
  # was updated due to information in the console

  # products should be displayed in alphabetical order by title

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  #ensure that there are no line items referencing this product

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

  # Here we declare the prodcut has many line items, and define a hook method named ensure_not_referenced....
  # The hook method is a method that Rails calls automatically at a given point in an object's life.
  # In this case, the method will be called before Rails attempts to destroy a row in the database.
  # If the hook method returns false, the row will not be destroyed. 

  validates :title, :description, :image_url, :presence => true 
  # text fields contain something before a row is written to the database
  
  validates :title, length: { minimum: 10 }
  # title should contain not less than 10 characters

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  # validates the price is greater or equal to 0.01

  validates :title, :uniqueness => true
  # validates that no other row in the products table has the same title as the row we are about to save

  validates :image_url, :format => {
    :with       => %r{\.(gif|jpg|png)\z}i,
    :message    => 'must be a URL for GIF, JPG or PNG image.'
  }
  # validates the image url to contain correct format of file extension

end
