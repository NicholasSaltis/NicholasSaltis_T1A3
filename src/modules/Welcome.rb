require 'rubygems'
require 'bundler/setup'
require 'json'
require 'artii'
require 'tty-box'
require 'colorize'
require 'colorized_string'
Bundler.require(:default)
# main menu method displaying ascii title, tty-box formatted welcome message.
def welcome
  clear
  ascii_heading("The  Bakers  Box")
  box_margin = ((TTY::Screen.width)-("Welcome to The Bakers Box".length)-6)/2
  box = TTY::Box.frame padding: 3, align: :center, left: box_margin, top: 6 do
   "Welcome to The Bakers Box\n\nThe percentage based\nRecipe management app"
  end
  print box
  space
end
# method that takes a string argument to be translated into ascii art title.
def ascii_heading(title_text)
  title = Artii::Base.new :font => 'doom'
  print title.asciify(title_text).colorize(:green) # colours the ascii art.
  space
end

