require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
Bundler.require(:default)
$prompt = TTY::Prompt.new



def convert_by_flour_weight(ingredients)
  input = gets.chomp.to_i
  flour = ingredients[0]
  total = input / flour[:flour]
  ingredients.each do | ingredient |
    ingredient.each do | i,p |
      puts "#{i}: #{(total*p).to_i}grams"
    end
  end
end
