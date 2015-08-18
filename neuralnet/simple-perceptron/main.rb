require './and.rb'
require './or.rb'
require './xor.rb'


andP = AndPerceptron.new
andP.train
andP.test

orP = OrPerceptron.new
orP.train
orP.test

xorP = XorPerceptron.new
xorP.train
xorP.test


