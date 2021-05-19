require_relative "./RecipeBook.rb"
require 'rubygems'
require 'bundler/setup'
require 'json'
require "tty-prompt"
Bundler.require(:default)

$prompt = TTY::Prompt.new
def main_menu
    menu = [
            { name: "View list of Recipes", value: 1},
            { name: "Input a new recipe into the recipe book", value: 2},
            { name: "Edit a recipe from the recipe book", value: 3},
            { name: "Display Help information", value: 4},
            { name: "Exit", value: 5}
           ]
    mm_choice = $prompt.select("Please select an option", menu)
    case mm_choice
    when 1
        rl_choice = $prompt.select("Select a recipe", recipe_list)
        select_recipe(rl_choice)
    when 2
      add_recipe
    when 3
      edit_recipe
    when 4
      help
    when 5      
      exit
    else

    end

end


