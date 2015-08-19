require './perceptron.rb'

class OrPerceptron < Perceptron::Base
  #w10,w20(h1,h2): 中間層しきい値 : 0.5 固定
  #v0(theta1): 出力層しきい値: 0.5 ~ 1.0の任意の値で初期化
  #w11,w12,w21,w22: 中間層結合荷重
  #v1,v2: 出力層結合荷重: -0.5 ~ 0.5 の任意の値で初期化
  #a1,a2: 中間層出力 : 0 or 1
  #y: 出力層出力 (0 or 1)
  #t: 教師信号(0 or 1)
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  def initialize
    @stop = 0.0005
    @train_set  = [[0,0,0],[0,1,1],[1,0,1],[1,1,1]]
    @test_set = [[0,0,0],[0,1,1],[1,0,1],[1,1,1]]
    @eta = 0.05

    @v0 = 1 
    @v1 = rand(-0.5...0.5)
    @v2 = rand(-0.5...0.5)

    @w10 = 1 
    @w11 = rand(-0.5...0.5) 
    @w12 = rand(-0.5...0.5) 

    @w20 = 1 
    @w21 = rand(-0.5...0.5) 
    @w22 = rand(-0.5...0.5)

    puts "initial values: "
    puts "               v0:#{@v0}, v1: #{@v1}, v2: #{@v2}"
    puts "               w10:#{@w10}, w11: #{@w11}, w12: #{@w12}"
    puts "               w20:#{@w20}, w21: #{@w21}, w22: #{@w22}"
  end

end

# orP = OrPerceptron.new
# orP.train
# orP.test
