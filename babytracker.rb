# encoding: UTF-8

Product = Struct.new(:amount, :name)

require 'sinatra'

PRODUCTS = [
	Product.new(
		50,
		'Marchewka'
	),
	Product.new(
		100,
		'Mleko sztuczne'
	),
	Product.new(
		2,
		'Jabłko'
	)
]

get '/' do 
	@product = PRODUCTS
	erb :index
end

post '/create' do
	params.inspect
	new_product = Product.new(
		params["number"].to_i,
		params["name"]
		)
	PRODUCT << new_product
	redirect "/"
end