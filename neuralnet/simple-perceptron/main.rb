require './and.rb'
require './or.rb'
require './xor.rb'


puts "<AND>"
andP = AndPerceptron.new
andP.train
andP.test

puts "<OR>"
orP = OrPerceptron.new
orP.train
orP.test

puts "<XOR>"
xorP = XorPerceptron.new
xorP.train
xorP.test


