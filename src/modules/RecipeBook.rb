require 'rubygems'
require 'bundler/setup'
require 'json'
Bundler.require(:default)

class RecipeBook

@@list_of_recipes = []
    def initialize(recipe_name, recipe_ingredients)
      @recipe_name = recipe_name
      @recipe_ingredients = @recipe_ingredients
      @@list_of_recipes << @recipe_name
    end
end
def print_recipes
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)

  recipe_hash["recipes"].each do | r, i |

      puts r

      i.each do |value|
          ingredient = value.keys
          ingredient = ingredient[0]
          percentage = value.values
          percentage = percentage[0]
          puts "#{ingredient}: #{percentage}%"
      end

  end
end

print_recipes