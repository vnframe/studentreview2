require "sinatra"

get '/' do
  erb :sandwich_parts
end

post "/sandwich_parts" do
  topping = params[:topping]
  topping = topping.to_s
redirect "/confirmation?topping=" + topping

end
get "/confirmation" do
  topping = params[:topping].split
  # topping = topping.split
  puts topping
  #topping = topping.to_a
  erb :confirmation, :locals => {:topping => topping}
end
post "/confirmation" do
  topping = params[:topping].to_s
  redirect "/results?topping=" + topping
end