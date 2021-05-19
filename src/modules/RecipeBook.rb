require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
Bundler.require(:default)
$prompt = TTY::Prompt.new
class RecipeBook

@@list_of_recipes = []
    def initialize(recipe_name, recipe_ingredients)
      @recipe_name = recipe_name
      @recipe_ingredients = @recipe_ingredients
      @@list_of_recipes << @recipe_name
    end
end




def recipe_list
  recipes_json = File.read('JSON/recipes.json')
  recipe_hash = JSON.parse(recipes_json)
  recipe_list_options = []
#   menu_value = 1
  recipe_hash["recipes"].each do | r, i |
    menu_option = { name: r, value: r }
    recipe_list_options << menu_option
    # menu_value += 1
  end
  recipe_list_options << { name: "Go Back", value: 1 }
  return recipe_list_options
end

def select_recipe(choice)
    recipes_json = File.read('JSON/recipes.json')
    recipe_hash = JSON.parse(recipes_json)
    recipe_hash["recipes"].each do | l, v |
      if l == choice
        puts "#{l}"
        v.each do |value|
          value.each do | x,y |
        #   ingredient = value.keys
        #   percentage = value.values
          puts "#{x}: #{y}%"
          end
        end
      end
    end
end
# p rl_choice







# def print_recipes
#   recipes_json = File.read('JSON/recipes.json')
#   recipe_hash = JSON.parse(recipes_json)

#   recipe_hash["recipes"].each do | r, i |

#       puts r

#       i

#   end
# end

# print_recipes