class AddProducts < ActiveRecord::Migration
  def change
  	Product.create ({
	  	:title => 'Hawaiian',
	  	:description => 'This is Hawaiian pizza',
	  	:price => 350,
	  	:size => 30,
	  	:is_spicy => false,
	  	:is_veg => false,
	  	:is_best_offer => false,
	  	:path_to_image => '/images/hawaiian.jpg'  	
	  	})

  	Product.create ({
	  	:title => 'Pepperoni',
	  	:description => 'This is Pepperoni pizza',
	  	:price => 450,
	  	:size => 30,
	  	:is_spicy => false,
	  	:is_veg => false,
	  	:is_best_offer => false,
	  	:path_to_image => '/images/pepperoni.jpg'
	  	})

  	Product.create ({
	  	:title => 'Vegetarian',
	  	:description => 'This is Vegetarian pizza',
	  	:price => 400,
	  	:size => 30,
	  	:is_spicy => false,
	  	:is_veg => true,
	  	:is_best_offer => false,
	  	:path_to_image => '/images/veg.jpg'
	  	})

  	Product.create ({
	  	:title => 'Gorgonzola',
	  	:description => 'This is Gorgonzola pizza',
	  	:price => 475,
	  	:size => 30,
	  	:is_spicy => true,
	  	:is_veg => false,
	  	:is_best_offer => true,
	  	:path_to_image => '/images/gorgonzola.jpg'
	  	})
  end
end
