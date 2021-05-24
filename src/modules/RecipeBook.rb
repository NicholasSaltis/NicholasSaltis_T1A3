require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
require_relative ("./converters.rb")
Bundler.require(:default)
$prompt = TTY::Prompt.new

class RecipeBook
  attr_reader :recipe_name, :recipe_ingredients
  @@list_of_recipes = []
  @@recipe_list_choice = 0
  @@instances = []

  def initialize(recipe)
    @@list_of_recipes << recipe
    @@instances << self
    recipe_name = recipe.keys
    recipe_ingredients = recipe.values
    @recipe_name = recipe_name[0]
    @recipe_ingredients = recipe_ingredients[0]
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

  def self.all_recipe_instances
    @@instances.inspect
  end

  def self.delete_recipe(recipe_name_to_delete)
    @@list_of_recipes.each_with_index do |recipe,index|
      recipe.each do |r,i|
        if r == recipe_name_to_delete
          @@list_of_recipes.delete_at(index)
        end
      end
    end
  end
# end of RecipeBook class
end


