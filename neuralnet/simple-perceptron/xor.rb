require './perceptron.rb'

class XorPerceptron < Perceptron::Base
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  def initialize
    @@train_set  = [[0,0,0],[0,1,1],[1,0,1],[1,1,0]]
    @@test_set = [[0,0,0],[0,1,1],[1,0,1],[1,1,0]]
    @@epsilon = 0.05
    @v0 = rand(0.5...1.0)
    @v1 = rand(-0.5...0.5)
    @v2 = rand(-0.5...0.5)
    puts "initial values: v1: #{@v1}, v2: #{@v2}"
  end

end

# a = XorPerceptron.new
# a.train
# a.test

