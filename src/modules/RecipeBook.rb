require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
require 'artii'
require 'colorize'
require_relative ("./converters.rb")
Bundler.require(:default)
$prompt = TTY::Prompt.new

# class for creating instances of recipes from json hash.
class RecipeBook
  attr_reader :recipe_name, :recipe_ingredients
  @@list_of_recipes = [] # stores each initialized recipe as a hash.
  @@recipe_list_choice = 0 # is updated when selection is made by recipe_list method.
  @@instances = []
# init method appends list_of_recipes and stores individual recipe names/ingredients.
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
    system "clear"
    title = Artii::Base.new :font => 'doom'
    print title.asciify("Recipe  Book").colorize(:green)
    recipe_list_options = [] # array for tty-prompt options made of instanced recipes.
    @@list_of_recipes.each do |recipe| # iterates over recipe list array and formats values for use in tty-prompt options. 
      recipe.each do | r,i |
        menu_option = { name: r, value: r }
        recipe_list_options << menu_option
      end
    end
    recipe_list_options << { name: "Back to main menu", value: 1 }
    rl_choice = $prompt.select("Select a recipe", recipe_list_options) # tty-prompt menu for selecting recipe
    @@recipe_list_choice = rl_choice # updates with name of recipe selected.
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
# called by delete recipe option in edit recipe and parses list_of_recipes for match to passed argument (recipe name) and deletes it at the matching index.
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


