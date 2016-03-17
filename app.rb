#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Создание подключения к БД при помощи Active Record
set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end


get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	@orders_input = params[:orders]
	@orders = parse_order_line @orders_input

#если корзина буста, сообщаем об этом.
	if @orders.length == 0
		return erb :cart_is_empty
	end

	@orders.each do |order|
		order[0] = Product.find(order[0])
	end

	erb :cart
end

def parse_order_line orders_input
	arr = (orders_input.delete "product_").split(',').map{|el| el.split('=')}
	return arr
end

post '/place_order' do
  order = Order.new params[:order]
  order.save
  erb :order_placed
end

get '/orders' do
  @list = Order.order('created_at DESC')
  erb :orders
end