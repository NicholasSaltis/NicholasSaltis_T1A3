def gets_new_ingredient_pair
  puts "Please enter a new ingredient name"
  new_ingredient_name = gets.chomp.to_s
  puts "Please enter a new decimal number between 0 and 1 to represent the ingredient's percentage of  the whole recipe"
  new_percentage = gets.chomp.to_f
  new_ingredient_pair = {new_ingredient_name=>new_percentage}
  return new_ingredient_pair
end

def add_ingredient(r,i)
  new_ingredient_pair = gets_new_ingredient_pair
  i << new_ingredient_pair
end

def delete_ingredient

def edit_ingredient(r,i)
  puts "#{r}"
  ingredient_select_options = []
  i.each do |ingredient_pair|
    ingredient_pair.each do |i,p|
        ingredient_select_options << {name: "#{i}: #{p}", value: i}
    end
  end
  ingredient_select = $prompt.select("select an ingredient to re-enter", ingredient_select_options)
  new_ingredient_pair = gets_new_ingredient_pair
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
  RecipeBook.list_of_recipes.each do |match|
    match.each do |x,y|
    if r == x
      RecipeBook.delete_recipe(x)
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

def edit_recipe_options(r,i)
    edit_options = [
                     {name: "Add a new ingredient to the recipe", value: 1},
                     {name: "select an ingredient to re-enter", value: 2},
                     {name: "Delete Recipe", value: 3},
                     {name: "back to recipe select", value: 4}
                   ]  
    recipe_edit_options = $prompt.select("What would you like to do with this recipe", edit_options)
    case recipe_edit_options
    when 1
      add_ingredient(r,i)
    when 2
      edit_ingredient(r,i)
    when 3
      delete_recipe(r,i)
    when 4
      system "clear"
      main_menu(3)
    end
end
  
def edit_recipe
    puts "please select a recipe to edit"
    if RecipeBook.recipe_list == 1
      system "clear"
      main_menu(main_menu_prompt)
    else
      parse_recipes = RecipeBook.list_of_recipes
        parse_recipes.each do |recipe|
            recipe.each do | r,i | 
            if r == RecipeBook.recipe_list_choice.to_s
              puts "#{r}"
              i.each do |value|
                value.each do | x,y |
                    puts "#{x}: #{y}%"
                end
              end
              while edit_recipe_options(r,i) != 4
                edit_recipe_options(r,i)
              end
            end
          end
        end
    end
end