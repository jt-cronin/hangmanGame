require "CSV"
require 'pry'

def intro
	puts "Welcome to my hangman game, you have to guess what word I am thinking of. However, if you guess seven wrong letters, you will lose... Good Luck!"
	puts "*Guess one letter at a time*"
	puts
end



#Makes a list of words meeting our criteria for the game
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






#Random Word Pick Class
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



#Changes/Hides the display of the word
def hideWord (word)
	numDashes = word.length
	displayDash = Array.new(numDashes) { |i| 
	i = "_" }

	return displayDash.join(" ")
end







#Gameplay Class


def gamePlay(wordChosen, lettersGuessed)
	binding.pry
	$i = 0
	$n = 7
	@goodLet = Array.new(wordChosen.length)
	while $i < $n do
		puts "What letter would you like to guess"
		letter = gets.chomp.upcase

		position = wordChosen.index(letter)
		if position != nil
			@goodLet = @goodLet.insert(position, letter)
		else
			$i += 1
		end
		puts @goodLet.join()
	end

	return false
end





#End of game message
def winLoseMessage(winLose, word)
	if winLose == true
		puts "Congrats! You have won the game"
	else
		puts "The word was #{word.capitalize}"
	end
end


