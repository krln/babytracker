# encoding: UTF-8

Serving = Struct.new(:amount, :name)

require 'sinatra'

SERVINGS = [
	Serving.new(
		50,
		'Marchewka'
	),
	Serving.new(
		100,
		'Mleko sztuczne'
	),
	Serving.new(
		2,
		'Jabłko'
	)
]

get '/' do 
	@servings = SERVINGS
	erb :index
end

post '/create' do
	params.inspect
	new_serving = Serving.new(
		params["number"].to_i,
		params["name"]
		)
	SERVINGS << new_serving
	redirect "/"
end