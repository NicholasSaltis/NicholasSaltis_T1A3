require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
require_relative ("./converters.rb")
Bundler.require(:default)
$prompt = TTY::Prompt.new

class RecipeBook
#   attr_reader :@recipe_name, :@recipe_ingredients
@@list_of_recipes = []
@@recipe_list_choice = 0
  def initialize(recipe)
    @@list_of_recipes << recipe
  end
# displays list of recipe names that have been instansiated as a tty-prompt with an extra return to main menu option. updates class variable of most recent choice.
  def self.recipe_list
    recipe_list_options = []
    @@list_of_recipes.each do |recipe|
      recipe.each do | r,i |
        menu_option = { name: r, value: r }
        recipe_list_options << menu_option
      end
    end
    recipe_list_options << { name: "Back to main menu", value: 1 }
    rl_choice = $prompt.select("Select a recipe", recipe_list_options)
    @@recipe_list_choice = rl_choice
    return rl_choice
  end

#class variable getters
  def self.recipe_list_choice
    @@recipe_list_choice
  end

  def self.list_of_recipes
    @@list_of_recipes
  end
# end of RecipeBook class
end

# reads recipe.json file and returns a ruby hash
def read_json
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)
  return recipe_hash
end
  # initialises each recipe from the recipes.json file via read_json method
def load_recipes
  recipes = read_json
  recipes[:recipes].each do | recipe_name, recipe_ingredients |
    recipe = {recipe_name: recipe_ingredients}
    recipe_name = RecipeBook.new(recipe)
  end
end


























# def recipe_list
#   recipes_json = File.read('JSON/recipes.json')
#   recipe_hash = JSON.parse(recipes_json)
#   recipe_list_options = []
#   recipe_hash["recipes"].each do | r, i |
#     menu_option = { name: r, value: r }
#     recipe_list_options << menu_option
#   end
#   recipe_list_options << { name: "Go Back", value: 1 }
#   return recipe_list_options
# end

# def select_recipe(choice)
#     recipes_json = File.read('JSON/recipes.json')
#     recipe_hash = JSON.parse(recipes_json)
#     recipe_hash["recipes"].each do | l, v |
#       if l == choice
#         puts "#{l}"
#         v.each do |value|
#           value.each do | x,y |
#           puts "#{x}: #{y}%"
#           end
#         end
#       elsif choice == 1
#         main_menu
#       end
#       recipe_options = [ 
#                           { name: "Convert recipe from flour weight", value: 1},
#                           { name: "Convert recipe from total weight", value: 2},
#                           { name: "Back to Recipe Book", value: 3}
#                        ]
#       conversion_options = $prompt.select("What would you like to do with this recipe", recipe_options)
#       case conversion_options
#       when 1
#         convert_by_flour_weight(ingredients)
#       when 2
#         convert_by_total_weight(ingredients)
#       when 3
#         recipe_list
#       end
#     end
# end
