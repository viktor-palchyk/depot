<<<<<<< HEAD
Order.transaction do 
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}", :address => "#{i} Main Street", :email => "customer-#{i}@example.com", :pay_type => "Check")
=======
Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}", :address => "#{i} Main Street",
      :email => "customer-#{i}@example.com", :pay_type => "Check")
>>>>>>> 7c3f32ca2fad0800a622176541557574ae4f79d4
  end
end