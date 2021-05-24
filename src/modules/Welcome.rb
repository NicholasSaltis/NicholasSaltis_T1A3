require 'rubygems'
require 'bundler/setup'
require 'json'
require 'artii'
require 'tty-box'
require 'colorize'
require 'colorized_string'
Bundler.require(:default)

def welcome
  clear
  title = Artii::Base.new :font => 'doom'
  print title.asciify("The  Bakers  Box").colorize(:green)
  box = TTY::Box.frame "Welcome to The Bakers Box", padding: 3, align: :center
  print box
end

def recipebook_ascii
  title = Artii::Base.new :font => 'doom'
  print title.asciify("Recipe  Book").colorize(:green)
end

def add_recipe_ascii
  title = Artii::Base.new :font => 'doom'
  print title.asciify("Add  recipe").colorize(:green)
end

def edit_recipe_ascii
  title = Artii::Base.new :font => 'doom'
  print title.asciify("Edit  Recipe").colorize(:green)
end

def conversions_ascii
  title = Artii::Base.new :font => 'doom'
  print title.asciify("Conversions").colorize(:green)
end

def help_ascii
  title = Artii::Base.new :font => 'doom'
  print title.asciify("Help").colorize(:green)
end

