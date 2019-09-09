require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
# require_relative "./models/wizard"

set :bind, '0.0.0.0'  # bind to all interfaces

# get '/' do
#   redirect "/wizards"
# end

WIZARDS = [
  {name: "Harry Potter", age: 18, power_type: "YOUTHS"},
  {name: "Gandalf", age: 10000, power_type: "grey" },
  {name: "Usidor", age: 275, power_type: "Cranky Podcast power"},
  {name: "Zatanna", age: 21, power_type: "Illusion"},
  {name: "Hermione", age: 18, power_type: "THE POWER TO DO ALL OF THE WORK"}
]

get '/' do
  redirect "/wizards"
end

get "/wizards" do
  @wizards = WIZARDS

  erb :index
end

get "/wizards/:wizard_name" do
  @wizard_name = params[:wizard_name]

  erb :show
end

get "/foobar" do

  erb :foobar
end
