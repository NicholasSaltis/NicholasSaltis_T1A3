require "json"

def add_recipe_options
  prompt_options = [
                     {name: "Add ingredient", value: 1 },
                     {name: "Finish and save to Recipe Book", value: 2}
                   ]
  choice = $prompt.select("What would you like to do?", prompt_options)
end

def new_recipe
  puts "What is the recipe's name?"
  recipe_name = gets.chomp.to_s
  recipe_ingredients = []
  while add_recipe_options == 1
    puts "enter ingredient"
    ingredient_name = gets.chomp.to_s
    puts "Enter a number between 0 and 1 that represents the" 
    puts "ingredient's percentage of the whole. (eg. 0.5 = 50%, 0.22 = 22%)"
    ingredient_percentage = gets.chomp.to_f;
    ingredient_pair = {ingredient_name => ingredient_percentage}
    recipe_ingredients << ingredient_pair
  end
#   new_recipe_hash = {recipe_name => recipe_ingredients}
#   puts new_recipe_hash
  recipe_json = read_json
  recipe_json["recipes"][recipe_name] = recipe_ingredients
  File.write("JSON/recipes.json", JSON.dump(recipe_json))
end