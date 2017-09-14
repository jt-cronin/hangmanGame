require "CSV"
require "pry"
require_relative 'functions.rb'

intro()
list = makeFirstList()

wordChosen = pickWord(list).chars.join

lettersGuess = hideWord(wordChosen)

winLose = gamePlay(wordChosen, lettersGuess)

winLoseMessage(winLose, wordChosen)



