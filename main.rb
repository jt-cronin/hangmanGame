require "CSV"
require "pry"
require_relative 'functions.rb'

right_guess = ''

intro()
list = makeFirstList()

wordChosen = pickWord(list).chars.join

# lettersGuess = hideWord(wordChosen)
gamePlay(wordChosen)
# winLose = gamePlay(wordChosen)

# winLoseMessage(winLose, wordChosen)



