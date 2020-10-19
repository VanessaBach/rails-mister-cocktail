# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"

response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
repos = JSON.parse(response)
repos.size

repos["drinks"].each do |ingredient|
	Ingredient.create(           # ----  O create faz a funcao do Post.new + save!
    	name: ingredient["strIngredient1"]
  	)
end
puts 'Finished!'
