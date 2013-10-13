require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_select '#columns #side a', :minimum => 4
    # looks for an element named a that is contained in an element with an id with a value of side
    # which is contained within an element with an id with a value of columns. 
    # This test verifies that there are a minimum of four such elements. 
    assert_select '#main .entry', 3
    # verifies that there are three elements with a class name of entry inside the main portion of the page
    assert_select 'h3', 'Programming Ruby 1.9'
    # The next line verifies that there is a h3 element with the title of the Rails book
    # that we had entered previously
    assert_select '.price', /\$[,\d]+\.\d\d/
    # We verify that there is a price which has a value which contains a dollar sign
    # followed by any number (but at least one) commas or digits, followed by a decimal point,
    # followed by two digits.
    
    # selectors that start with a pound sign (#) match on id attributes,
    # selectors that start with a dot (.) match on class attributes, 
    # and selectors that contain no prefix at all match on element names.
  end  

end
