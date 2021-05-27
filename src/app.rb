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
require 'rspec'
Bundler.require(:default)

$prompt = TTY::Prompt.new

# reads recipe.json file and returns a ruby hash
def read_json
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)
  return recipe_hash
end
# for rspec testing purposes
def read_json_test
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)
  return recipe_hash
end
# initialises each recipe from the recipes.json file via read_json method
def load_recipes(recipes)
  # loads a placeholder recipe hash in event of empty recipes value hash
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
# formatting tool
def space
  puts ""
end
# clear screen method
def clear
  system "clear"
end
# command line argument assigned to arg variable if present
arg = ARGV[0].strip.downcase if ARGV[0]
# error handling for empty or unparseable json file, overwrites file with correctly formatted placeholder hash
begin
  load_recipes(read_json)
rescue
  placeholder = {"recipes"=>{"Placeholder"=>[{"flour"=>0.5}]}}
  File.write("JSON/recipes.json", JSON.dump(placeholder))
  retry
end
# case statement for command line arguments if arg = nil then passes over without anything triggering.
if arg == "-h" || arg == "-help"
  # jumps straight to help menu
  main_menu(4)  
elsif arg == "-u" || arg == "-usage"
  # displays a naviagtion tutorial before loading into main menu screen
  ascii_heading("Tutorial")
  # framing for text using tty-box
  tutorial_frame = TTY::Box.frame( width: TTY::Screen.width,
                               padding: 1,
                               top: 8,
                               height: 11,
                               align: :left
                              ) do
  "Welcome to The Bakers Box.  for further help with the details of the app select the help option from the main menu"
  end
  print tutorial_frame
  # tty-prompt keypress functionality to hold the tutorial screen before progressing onto main menu
  
  highlight = "Enter/Return".green # highlights the key to be pressed to move to next screen
  $prompt.keypress("Press #{highlight} key to begin using The Bakers Box", keys: [:return])

# jumps straight to recipe book screen
elsif arg == "-r" || arg == "-recipes"
  main_menu(1)
end
# calls main menu with the tty-prompt as an argument. main method call for the entire app.
main_menu(main_menu_prompt)
