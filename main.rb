require "CSV"
require "pry"
require_relative 'functions.rb'



@list = Array.new

CSV.foreach("dictionary.csv", {headers: true, return_headers: false}) do |row|
	word = row['Word']

	if wordCheck(word)
		@list << word
	end

end

puts @list.length

# randNum = Random.new()

# chosenWord = @list.