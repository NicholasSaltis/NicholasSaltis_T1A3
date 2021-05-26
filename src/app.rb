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
  if recipes["recipes"].empty? 
    placeholder_recipe = {"Placeholder"=>[{"flour"=>0.5}]}
    RecipeBook.new(placeholder_recipe)
  else
    recipes["recipes"].each do | recipe_name,recipe_ingredients |
      recipe = {"#{recipe_name}" => recipe_ingredients}
      recipe_name = RecipeBook.new(recipe)
    end
  end
end
# for testing clarity
def line_break
  width = (TTY::Screen.width)-2
  puts "<#{"-"*width}>"
end

def space
  puts ""
end

def clear
  system "clear"
end

arg = ARGV[0].strip.downcase if ARGV[0]

load_recipes(read_json)

if arg == "-h" || arg == "-help"
  main_menu(4)  
elsif arg == "-u" || arg == "-usage"
  ascii_heading("Tutorial")
  tutorial_frame = TTY::Box.frame( width: TTY::Screen.width,
                               padding: 1,
                               top: 8,
                               height: 11,
                               align: :left
                              ) do
  "Welcome to The Bakers Box. Use arrow keys up and down to navigate menus. Press enter to select a highlighted menu option. Use keys to enter numbers or text when prompted. Use last menu options to return to previous page. Keep choosing last option to return to main menu. To exit the app select the exit option from the main menu. for further help with the details of the app select the help option from the main menu"
  end
  print tutorial_frame
  highlight = "Enter/Return".green
  $prompt.keypress("Press #{highlight} key to begin using The Bakers Box", keys: [:return])

elsif arg == "-r" || arg == "-recipes"
  main_menu(1)
end

main_menu(main_menu_prompt)
