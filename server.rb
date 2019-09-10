require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require "csv"
# require_relative "./models/wizard"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect "/wizards"
end

get "/wizards" do
  # @wizards = CSV.readlines("wizards.csv", headers: true)
  @wizards = []

  CSV.foreach("wizards.csv", headers: true) do |row|
    @wizards << row.to_hash
  end

  erb :index
end


get "/wizards/new" do
  erb :new
end




post "/wizards" do
  # binding.pry

  name = params["name"]
  age = params["age"]
  power_type = params["power_type"]

  # if name.strip.empty?
  if name == ""
    erb :new
  else
    CSV.open("wizards.csv", "a") do |csv_file|
      csv_file << [name, age, power_type]
    end

    redirect "/wizards"
  end

end

# get "/wizards/:wizard_name" do
#   @wizard_name = params[:wizard_name]
#
#   erb :show
# end
