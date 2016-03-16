class CreateOrders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
  		t.string :customer_name
  		t.string :phone
  		t.string :customer_adrs
  		t.string :orders_input
  		
  		t.timestamps null: false
  	end
  end
end
