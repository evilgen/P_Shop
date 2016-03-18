#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Создание подключения к БД при помощи Active Record
set :database, "sqlite3:pizzashop.db"

#Создание сущности Продукт с наследованием
class Product < ActiveRecord::Base
end

#Создание сущности Заказ с наследованием
class Order < ActiveRecord::Base
end

#Отображение всех продуктов (пиц)
get '/' do
	@products = Product.all
	erb :index
end

get '/about' do
	erb :about
end

#Отображение содержимого корзины
post '/cart' do
#Помещаем в переменную список выбранных товаров в виде строки order_#=#...
	@orders_input = params[:orders]
#Создание массива с индексами товаров и их количествами вида id_товара = количество_товара	
	@orders = parse_order_line @orders_input

#если корзина буста, сообщаем об этом.
	if @orders.length == 0
		return erb :cart_is_empty
	end
#если корзина не пуста помещаем в ячейку с id товара его сущность
	@orders.each do |order|
		order[0] = Product.find(order[0])
	end

	erb :cart
end

#функция, которая разбирает строку заказа и преобразовывает ее в массив id = количество
def parse_order_line orders_input
	arr = (orders_input.delete "product_").split(',').map{|el| el.split('=')}
	return arr
end

#обработчие post-запроса /place_order
#браузер отправляет страницу на сервер
post '/place_order' do
#Производим создание и запись заказа в БД
  order = Order.new params[:order]
  order.save
  erb :order_placed
end

#вывод списка всех заказов в обратном порядке (самые свежие вверху)
get '/orders' do
  @list = Order.order('created_at DESC')
  erb :orders
end