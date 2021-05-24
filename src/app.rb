require_relative "./modules/RecipeBook.rb"
require_relative "./modules/Welcome.rb"
require_relative "./modules/main_menu.rb"
require_relative "./modules/converters.rb"
require_relative "./modules/new_recipe.rb"
require_relative "./modules/edit_recipe.rb"
require "tty-prompt"
require 'rubygems'
require 'bundler/setup'
require 'json'
Bundler.require(:default)

$prompt = TTY::Prompt.new

# reads recipe.json file and returns a ruby hash
def read_json
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)
  return recipe_hash
end
# initialises each recipe from the recipes.json file via read_json method
def load_recipes(recipes)
  recipes["recipes"].each do | recipe_name,recipe_ingredients |
    recipe = {"#{recipe_name}" => recipe_ingredients}
    recipe_name = RecipeBook.new(recipe)
  end
end

def line_break
  puts "              !!                "
  puts "<------------------------------>"
  puts "              !!                "
end


load_recipes(read_json)
welcome
main_menu(main_menu_prompt)
puts RecipeBook.all_recipe_instances
