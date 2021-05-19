require_relative "./modules/RecipeBook.rb"
require_relative "./modules/Welcome.rb"
require_relative "./modules/main_menu.rb"
require "tty-prompt"
require 'rubygems'
require 'bundler/setup'
require 'json'
Bundler.require(:default)

$prompt = TTY::Prompt.new

$prompt.select("choose:", %w(Nick Jack Ben))