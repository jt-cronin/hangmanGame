require "CSV"
require "pry"
require_relative 'functions.rb'


list = makeFirstList()

wordChosen = pickWord(list)

puts wordChosen

