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

def get_placeholder word, guessed_word
  placeholder = ''
  word.chars { |char| 
    placeholder += (guessed_word.include? char)? char : '_'
  }

  placeholder
end


def gamePlay (word)
	puts 'Guess what is:'+ get_placeholder(word, '')
	total_chances = 7
	wrong_try = 0
	right_guess = ""
	wrongLet = Array.new

	while true
	  print "Enter word [#{total_chances - wrong_try} chances left]:"

	  char = gets.chomp.upcase
	  puts `clear`
	  
	  if word.include? char

	    if(right_guess.include? char)
	      puts char + ' is already given and accepted.'
	      puts 'Try another: ' + get_placeholder(word, right_guess)
	    else
	      right_guess = right_guess + char
	      placeholder = get_placeholder(word, right_guess)
	      puts wrongLet.join (" ")
	      puts 'Great! ' + placeholder

	    end

	    unless placeholder.include? '_'
	      puts "WELL DONE!! You have beaten me at Hangman"
	      break
	    end
	  else
	    puts "Sorry! The word dosen't contains '#{char}'"
	    
	    wrongLet.push(char)
	    puts wrongLet.join(" ")
	    wrong_try += 1

	    if (wrong_try == total_chances)
	      puts "YOU HANGED! - the word was #{word}"
	      break
	    else
	      puts 'Try another: ' + get_placeholder(word, right_guess)
	    end
	  end

	end
end



# #Gameplay Class

# # Given a word, like banana, display "_" for each character except "a".
# 	def 
# 	word = "banana"
# 	hiddenWord = word.gsub(/{[a..z]/, "_")


# game = Hangman.new # Side effect is that the secret word is chosen.

# while game.in_progress?
# 	guess = game.receive_guess

# 	game.check_if_guess_is_in_word(guess)

# 	game.secret_word
# 	# => "banana"

# 	game.displayed_word
# 	# "______"

# 	# Given a word, like banana, display "_" for each character except "a".
# 	def 
# 	word = "banana"
# 	hiddenWord = word.gsub(/{[a..z]/, "_")
# 	# Given a word like banana and a string like "_a_a_a", display "_" for each character except "n" (and don't remove the "a"s that are already there).

# 	game.update_displayed_word("a")
# 	# "_a_a_a"
# end


# def gamePlay(wordChosen, lettersGuessed)
# 	wordChosen = wordChosen.chars
# 	binding.pry
# 	$i = 0
# 	$n = 7
# 	$goodCount = 0
# 	@goodLet = Array.new(wordChosen.length)
# 	while $i < $n do
# 		puts "What letter would you like to guess"
# 		letter = gets.chomp.upcase

# 		wordChosen.each do |i|
# 			position = wordChosen.index(letter)
# 			if position != nil
# 				@goodLet = @goodLet.insert(position, letter)
# 				$goodCount += 1
# 				if $goodCount = wordChosen.length
# 					break
# 				end
# 			else
# 				$i += 1
# 			end
# 		end
# 		puts @goodLet.join()
# 	end
# 	if $goodCount = wordChosen.length
# 		return true
# 	else
# 		return false
# 	end

# end





#End of game message
def winLoseMessage(winLose, word)
	if winLose == true
		puts "Congrats! You have won the game"
	else
		puts "The word was #{word.capitalize}"
	end
end


