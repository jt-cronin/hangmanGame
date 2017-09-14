


def wordMin(word)
	word.length >= 5
end

def wordMax(word)
	word.length <= 12
end

def wordCheck(word)
	(wordMin(word)) && (wordMax(word))
end