require './perceptron.rb'

class OrPerceptron < Perceptron::Base
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  @@train_set  = [[0,0,0],[0,1,1],[1,0,1],[1,1,1]]
  @@test_set = [[0,0,0],[0,1,1],[1,0,1],[1,1,1]]
  @@epsilon = 0.05
  
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  def initialize
    @v0 = rand(0.5...1.0)
    @v1 = rand(-0.5...0.5)
    @v2 = rand(-0.5...0.5)
    puts "initial values: v1: #{@v1}, v2: #{@v2}"
  end

end

a = OrPerceptron.new
a.train
a.test


