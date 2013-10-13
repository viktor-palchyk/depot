class Product < ActiveRecord::Base
  
  scope :order, -> { where(order: 'title') }
  # products should be displayed in alphabetical order by title



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
