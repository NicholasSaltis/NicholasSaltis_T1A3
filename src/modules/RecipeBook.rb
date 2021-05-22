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


