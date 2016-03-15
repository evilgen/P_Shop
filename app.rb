#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Создание подключения к БД при помощи Active Record
set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end


get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

post '/cart' do
	erb :cart
end

def parse_order_line orders_input
	arr = (t.delete! ("product_")).split(',').map{|elem| elem.split('=')}
end