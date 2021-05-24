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
  print title.asciify("The  Bakers  Box").colorize(:blue)
#   box = TTY::Box.frame "Welcome to The Bakers Box" padding: 5, align :center
#   print box
end
