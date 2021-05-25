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
#   title = Artii::Base.new :font => 'doom'
#   print title.asciify("The  Bakers  Box").colorize(:green)
  ascii_heading("The  Bakers  Box")
  box_margin = ((TTY::Screen.width)-("Welcome to The Bakers Box".length)-6)/2
  box = TTY::Box.frame padding: 3, align: :center, left: box_margin, top: 6 do
   "Welcome to The Bakers Box\n\nThe percentage based\nRecipe management app"
  end
  print box
  space
end

def ascii_heading(title_text)
  title = Artii::Base.new :font => 'doom'
  print title.asciify(title_text).colorize(:green)
  space
end

