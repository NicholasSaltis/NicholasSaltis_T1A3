require_relative "./RecipeBook.rb"
require_relative "./converters.rb"
require_relative "./new_recipe.rb"
require_relative "./help.rb"
require 'rubygems'
require 'bundler/setup'
require 'json'
require "tty-prompt"
Bundler.require(:default)

$prompt = TTY::Prompt.new
def main_menu_prompt
  welcome
    menu = [
        { name: "View list of Recipes", value: 1},
        { name: "Input a new recipe into the recipe book", value: 2},
        { name: "Edit a recipe from the recipe book", value: 3},
        { name: "Display Help information", value: 4},
        { name: "Exit", value: 5}
       ]
mm_choice = $prompt.select("Please select an option", menu)
return mm_choice
end

def main_menu(mm_choice)
    # takes main_menu_prompt output and uses it for a case statement to run selected method/s 
    case mm_choice
    when 1
        if RecipeBook.recipe_list == 1
            clear
            main_menu(main_menu_prompt)
        
        else
            # puts RecipeBook.recipe_list_choice
            clear
            ascii_heading("Conversions")
            parse_recipes = RecipeBook.list_of_recipes
            parse_recipes.each do |recipe|
              recipe.each do | r,i | 
                if r == RecipeBook.recipe_list_choice.to_s
                  puts "#{r}"
                  i.each do |value|
                    value.each do | x,y |
                      puts "#{x}: #{y*100}%"
                    end
                  end
                  while conversion_options(i) != 3
                    conversion_options(i)
                  end
                end
              end
            end 
        end
        
    when 2
    # add a new recipe to the recipe book
      new_recipe
      main_menu(main_menu_prompt)
    when 3
    # edit_recipe
      edit_recipe
      main_menu(main_menu_prompt)
    when 4
      help
    when 5      
      convert_array_of_hashes(RecipeBook.list_of_recipes)
      clear
      exit
      
    else

    end

end

def return_to_recipe_list
  system "clear"
  main_menu(1)
end

def convert_array_of_hashes(array_of_hashes)
  new_recipes_hash = {}
    array_of_hashes.each do |to_merge|
      to_merge.each do |r,i|
        new_recipes_hash[r] = i
      end
    end
  json_edit = {"recipes"=>new_recipes_hash}
  File.write("JSON/recipes.json", JSON.dump(json_edit))
end


