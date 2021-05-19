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
    $prompt.select("Please select an option", menu)

end

