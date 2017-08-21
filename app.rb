require "sinatra"

get '/' do
  erb :sandwich_parts
end

post "/sandwich_parts" do
  puts "MADE IT TO SANDWICH_PARTS post"
  topping = params[:topping].join(',')
  topping = topping.to_s
  puts "topping is #{topping}"
redirect "/confirmation?topping=" + topping
end

get "/confirmation" do
puts "MADE IT TO GET CONFIRM"
  topping = params[:topping].split(',')
  puts "Topping is #{topping}"

  erb :confirmation, :locals => {:topping => topping}
end
post "/confirmation" do
  puts "MADE IT TO POST CONFIRMATION"
  topping = params[:topping].join(',')
  puts "topping is #{topping}"
  redirect "/end?topping=" + topping 
end

get "/end" do 
  topping = params[:topping].split(',')
  erb :end, :locals => {:topping => topping}
end
post "/end" do
  topping = params[:topping].join(',')
end