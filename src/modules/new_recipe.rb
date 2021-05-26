require "json"

def add_recipe_options
  prompt_options = [
                     {name: "Add ingredient", value: 1 },
                     {name: "Finish and save to Recipe Book", value: 2}
                   ]
  choice = $prompt.select("What would you like to do?", prompt_options)
end

def new_recipe
  clear
  ascii_heading("Add  Recipe")
  puts "What is the recipe's name?"
  recipe_name = gets.chomp.to_s
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


