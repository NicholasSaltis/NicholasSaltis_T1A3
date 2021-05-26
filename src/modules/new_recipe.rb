require "json"

def add_recipe_options
  prompt_options = [
                     {name: "Add ingredient", value: 1 },
                     {name: "Finish and save to Recipe Book", value: 2}
                   ]
  choice = $prompt.select("What would you like to do?", prompt_options)
end

def validate_word_input
  valid_input = false
  until valid_input
    user_input = gets.downcase.chomp
    if user_input.to_i > 0 || user_input.kind_of?(Array) || user_input.kind_of?(Hash) || user_input.length > 50
      puts "Invalid input, please input a word less than 50 characters"
    else
      valid_input = true
      return user_input
    end
  end
end

def new_recipe
  clear
  ascii_heading("Add  Recipe")
  puts "What is the recipe's name?"
  recipe_name = validate_word_input
  recipe_ingredients = []
  while add_recipe_options == 1
    system "clear"
    ascii_heading("Add Recipe")
    puts recipe_name
    recipe_ingredients.each do |pair|
      pair.each do |i,p|
        puts "#{i}: #{p*100}%"
      end
    end
    ingredient_pair = gets_new_ingredient_pair
    recipe_ingredients << ingredient_pair
  end
#   new_recipe_hash = {recipe_name => recipe_ingredients}
#   puts new_recipe_hash
  instance_hash = {recipe_name => recipe_ingredients}
  RecipeBook.new(instance_hash)
  recipe_json = read_json
  recipe_json["recipes"][recipe_name] = recipe_ingredients
  File.write("JSON/recipes.json", JSON.dump(recipe_json))
end


