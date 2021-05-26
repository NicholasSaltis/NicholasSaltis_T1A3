require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
require_relative "./main_menu.rb"
require_relative "./RecipeBook.rb"
Bundler.require(:default)
$prompt = TTY::Prompt.new

# validates user input integer by looping and checking if it is of the Integer class and greater than 0 which works to both prevent negative numbers and to filter strings that have be coerced to integers (which always = 0)
def get_user_integer
  valid_input = false
  input = 0
  until valid_input do
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input.kind_of?(Integer)
      valid_input = true
      input += user_input
      clear
      break
    else
      puts "Incorrect input, please enter an integer greater than 0"
    end
  end
  return input
end
# conversion method to be called by conversion_options passing a recipe hash as an argument. 
# takes user input integer and divides it by the flour value in the recipe hash to find total weight of recipe
# iterates over hash first printing recipe name, then ingredient name and quantity in grams by multiplying total weight by the float value provided by hash.
def convert_by_flour_weight(ingredients)
  puts "Please input a number for the amount of grams of flour to be used"
  input = get_user_integer # validates integer for use in formula
  total_weight = 0
  flour = 0.0
  # parses ingredients array for a hash containing flour and uses its value. flour in recipe check is handled by conversion option selection method.
  ingredients.each do |parse_ingredients|
    if parse_ingredients.key?("flour")
      flour = parse_ingredients["flour"]
    end
  end
  # divides flour weight by its percentage (represented as a decimal) to find total weight of recipe and uses that value to find values of other ingredients in grams from percentage value. 
  total = input / flour
  ascii_heading("Conversions")
  ingredients.each do | ingredient |
    ingredient.each do | i,p |
      puts "#{i}: #{(total*p).to_i}grams" # iterator formats recipe list and handles value conversion.
      total_weight += (total*p).to_i # updates total weight with each iteration to print total eight
    end
  end
  puts "Total Recipe weight = #{total_weight} grams"
end

# conversion method to be called by conversion_options passing recipe hash as an argument.
# takes user input integer and iterates over recipe hash multiplying each value by the total weight and printing the result.
def convert_by_total_weight(ingredients)
  puts "Please input a number for the total target weight of this recipe"
  input = get_user_integer
  ascii_heading("Conversions")
  ingredients.each do | ingredient |
    ingredient.each do | i,p |
        puts "#{i}: #{(input*p).to_i} grams" # iterator formats and calculates input for output.
    end
  end
  puts "Total Recipe weight = #{input} grams"
end

# passes selected recipe ingredients onto conversion methods and tty-prompt select which opotion to choose using case.
def conversion_options(ingredients)
  recipe_options = [ 
                    { name: "Convert recipe from flour weight", value: 1},
                    { name: "Convert recipe from total weight", value: 2},
                    { name: "Back to Recipe Book", value: 3}
                   ]
conversion_options = $prompt.select("What would you like to do with this recipe", recipe_options)
  case conversion_options
  when 1
    # parses ingredients to check if flour is an ingredient and updates flour_in_recipe if true
  flour_in_recipe = false
  ingredients.each do |parse_ingredients|
    if parse_ingredients.key?("flour")
      flour_in_recipe = true
    end
  end
  # if flour is in recipe moves on to flour weight conversion
  if flour_in_recipe
    convert_by_flour_weight(ingredients)
  else
    # if flour is not in recipe it gives two tty-prompt options to either return to main menu to choose new recipe or edit. or to convert by flour weight instead
    no_flour_options = [
                         {name: "Return to main menu to select different recipe or edit this one", value: 1},
                         {name: "Convert recipe from total weight instead", value: 2}
                       ]
    no_flour_choice = $prompt.select("This recipe does not contain flour, please choose what you would like to do instead", no_flour_options)
    case no_flour_choice
    when 1
      main_menu(main_menu_prompt)
    when 2
      convert_by_total_weight(ingredients)
    end
  end
  # passes ingredients hash onto convert by total weight method.
  when 2
  convert_by_total_weight(ingredients)
  when 3
  # calls main_menu with argument for display recipe book option
  return_to_recipe_list
  end
end
