require "CSV"


def wordMin(word)
	word.length >= 5
end

def wordMax(word)
	word.length <= 12
end

def wordCheck(word)
	(wordMin(word)) && (wordMax(word))
end


def makeFirstList
	@list = Array.new

	CSV.foreach("dictionary.csv", {headers: true, return_headers: false}) do |row|
		word = row['Word']

		if wordCheck(word)
		@list << word
		end
	end
	return @list
end

def findMax(a)
	a.length
end

def genRandom(max)
	randNum = Random.new
	randNum = randNum.rand(5..max)
end	

def pickWord(list)
	wordChosen = list[genRandom(findMax(list))].upcase
end








