#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

#Создание подключения к БД при помощи Active Record
set :database, "sqlite3:pizzashop.db"

class Produt < ActiveRecord::Base
end


get '/' do
	erb :index
end

get '/about' do
	erb :about
end
