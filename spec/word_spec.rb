require_relative 'spec_helper.rb'
require_relative '../functions.rb'


describe "tests to sort out words" do
	it "takes words out that are too long or too short" do
		a = "hi"
		b = "welcome"
		c = "thiswordistoolong"

		aa = wordCheck(a)	
		bb = wordCheck(b)
		cc = wordCheck(c)

		expect(aa).to eq(false)
		expect(bb).to eq(true)
		expect(cc).to eq(false)
	end
end

describe "reports the end of game message" do
	it "tells you if you win or lose" do 
		a = true
		b = false
		c = "CONGRATS"

		aa = winLoseMessage(a,c)
		bb = winLoseMessage(b,c)

		expect(aa).to eq()
		expect(bb).to eq()
	end
end
