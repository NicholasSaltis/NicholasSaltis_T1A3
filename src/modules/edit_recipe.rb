require_relative './Welcome.rb'
# prompt user for a new ingredient percentage value pair
def gets_new_ingredient_pair
  puts "Please enter a new ingredient name"
  new_ingredient_name = validate_word_input # calls method for validating word input
  # validates percentage input by limiting input to a float between a tiny fraction of 0 and 1.0
  new_percentage = $prompt.ask("Enter a number between 0 and 1 that represents theingredient's percentage of the whole. (eg. 0.5 = 50%, 0.22 = 22%)") { |q| q.in("0.000001-1.0") }
  # Formats user input variables into hash to be used in ingredients array of recipe.
  new_ingredient_pair = {new_ingredient_name.downcase=>new_percentage.to_f}
  return new_ingredient_pair
end

# is passed recipe name r and ingredients hash i. puts recipe name and formats ingredients into a tty-prompt options array.
def prompt_list_of_ingredients(r,i)
  puts "#{r}"
  ingredient_select_options = []
  i.each do |ingredient_pair|
    ingredient_pair.each do |i,p|
      ingredient_select_options << {name: "#{i}: #{p}", value: i}
    end
  end
  ingredient_select = $prompt.select("select an ingredient to re-enter", ingredient_select_options)
end

# appends ingredients hash i with ingredient pair returned from gets_new_ingredient_pair method.
def add_ingredient(r,i)
  new_ingredient_pair = gets_new_ingredient_pair
  i << new_ingredient_pair
end

# calls ingredient tty-prompt menu select and iterates over passed ingredient hash with index and when delete choice matches an object in array then it deletes at that index.
def delete_ingredient(r,i)
  delete_choice = prompt_list_of_ingredients(r,i)
  i.each_with_index do |ingredient_pair,index|
    ingredient_pair.each do |ing,p|
      if delete_choice == ing 
        i.delete_at(index)
      end
    end
  end
end

# ingredient pair selected using prompt_list_of_ingredients and a new pair returned from gets_new_ingredient_pair
def edit_ingredient(r,i)
  ingredient_select = prompt_list_of_ingredients(r,i)
  new_ingredient_pair = gets_new_ingredient_pair
  # iteration over ingredients array with index and deletes and inserts hashes at index when ingredient names match.
  i.each_with_index do |ingredient_pair,index|
    ingredient_pair.each do |ing,p|
      if ingredient_select == ing 
        i.delete_at(index)
        i.insert(index, new_ingredient_pair)
      end
    end
  end
end

def delete_recipe(r,i)
#   puts RecipeBook.list_of_recipes
  RecipeBook.list_of_recipes.each do |match| # iterates over instanced recipes array from RecipeBook class
    match.each do |x,y| # iterates over each recipe hash and matches recipe names to selected recipe name
    if r == x
      RecipeBook.delete_recipe(x) # passes recipe name to delete_recipe class method.
      # re-formats recipes hash by pulling updated list_of_recipes array from RecipeBook class writes the newly formatted hash to json.
      edited_recipe_book = RecipeBook.list_of_recipes
      new_recipes_hash = {}
      edited_recipe_book.each do |to_merge|
        to_merge.each do |r,i|
          new_recipes_hash[r] = i
        end
      end
      json_edit = {"recipes"=>new_recipes_hash}
      File.write("JSON/recipes.json", JSON.dump(json_edit))
    else
    end
  end
end
end

# case for selecting method to use. passes through recipe name r, and ingredient array i. tty-prompt options array is called by tty-prompt select to make choice.
def edit_recipe_options(r,i)
    edit_options = [
                     {name: "Add a new ingredient to the recipe", value: 1},
                     {name: "select an ingredient to re-enter", value: 2},
                     {name: "select an ingredient to Delete", value: 3},
                     {name: "Delete Recipe", value: 4},
                     {name: "back to recipe select", value: 5}
                   ]  
    recipe_edit_options = $prompt.select("What would you like to do with this recipe", edit_options)
    case recipe_edit_options
    when 1
    # clear and ascii heading format and cleanup window.
      clear
      ascii_heading("Edit  Recipe")
      add_ingredient(r,i)
    when 2
      clear
      ascii_heading("Edit  Recipe")
      edit_ingredient(r,i)
    when 3 
      clear
      ascii_heading("Edit  Recipe")
      delete_ingredient(r,i)
    when 4
      clear
      ascii_heading("Edit  Recipe")
      delete_recipe(r,i)
      system "clear"
      main_menu(3) # returns to edit recipe options selection screen.
    when 5
      clear
      main_menu(3)
    end
end
  # Called by main_menu
def edit_recipe
    clear
    ascii_heading("Edit  Recipe")
    puts "please select a recipe to edit"
    if RecipeBook.recipe_list == 1 #select option from recipe book and uses outputs in an if else statement.
      system "clear"
      main_menu(main_menu_prompt)
    else
      clear
      ascii_heading("Edit  Recipe")
      parse_recipes = RecipeBook.list_of_recipes
        parse_recipes.each do |recipe|
            recipe.each do | r,i | 
            if r == RecipeBook.recipe_list_choice.to_s # Formats selected recipe 
              puts "#{r}"
              i.each do |value|
                value.each do | x,y |
                    puts "#{x}: #{y}%"
                end
              end
              while edit_recipe_options(r,i) != 5 # loops edit options until user selects return to main menu option.
                edit_recipe_options(r,i)
              end
            end
          end
        end
    end
end