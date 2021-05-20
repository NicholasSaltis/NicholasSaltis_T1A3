require 'rubygems'
require 'bundler/setup'
require 'json'
require 'tty-prompt'
Bundler.require(:default)
$prompt = TTY::Prompt.new