require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
require_relative "./main_menu.rb"
require_relative "./RecipeBook.rb"
Bundler.require(:default)
$prompt = TTY::Prompt.new



def convert_by_flour_weight(ingredients)
  puts "Please input a number for the amount of grams of flour to be used"
  input = gets.chomp.to_i
  total_weight = 0
  flour = ingredients[0]
  total = input / flour["flour"]
  ingredients.each do | ingredient |
    ingredient.each do | i,p |
      puts "#{i}: #{(total*p).to_i}grams"
      total_weight += (total*p).to_i
    end
  end
  puts "Total Recipe weight = #{total_weight} grams"
end

def convert_by_total_weight(ingredients)
  puts "Please input a number for the total target weight of this recipe"
  input = gets.chomp.to_i
  ingredients.each do | ingredient |
    ingredient.each do | i,p |
        puts "#{i}: #{(input*p).to_i} grams"
    end
  end
  puts "Total Recipe weight = #{input} grams"
end

def conversion_options(ingredients)
  recipe_options = [ 
                    { name: "Convert recipe from flour weight", value: 1},
                    { name: "Convert recipe from total weight", value: 2},
                    { name: "Back to Recipe Book", value: 3}
                   ]
conversion_options = $prompt.select("What would you like to do with this recipe", recipe_options)
  case conversion_options
  when 1
  convert_by_flour_weight(ingredients)
  when 2
  convert_by_total_weight(ingredients)
  when 3
  return_to_recipe_list
  end
end
