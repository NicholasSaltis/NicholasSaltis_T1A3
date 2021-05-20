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
  recipe_hash["recipes"].each do | r, i |
    menu_option = { name: r, value: r }
    recipe_list_options << menu_option
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
          puts "#{x}: #{y}%"
          end
        end
      end
      recipe_options = [ 
                          { name: "Convert recipe from flour weight", value: 1},
                          { name: "Convert recipe from total weight", value: 2},
                          { name: "Back to Recipe Book", value: 3}
                       ]
      conversion_options = $prompt.select("What would you like to do with this recipe", recipe_options)
      case conversion_options
      when 1
        convert_by_flour_weight
      when 2
        convert_by_total_weight
      when 3
        recipe_list
      end
    end
end
