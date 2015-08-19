require './perceptron.rb'

class AndPerceptron < Perceptron::Base
  #w10,w20(h1,h2): 中間層しきい値 : 0.5 固定
  #v0(theta1): 出力層しきい値: 0.5 ~ 1.0の任意の値で初期化
  #w11,w12,w21,w22: 中間層結合荷重
  #v1,v2: 出力層結合荷重: -0.5 ~ 0.5 の任意の値で初期化
  #a1,a2: 中間層出力 : 0 or 1
  #y: 出力層出力 (0 or 1)
  #t: 教師信号(0 or 1)
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  def initialize
    @train_set  = [[0,0,0],[0,1,0],[1,0,0],[1,1,1]]
    @test_set = [[0,0,0],[0,1,0],[1,0,0],[1,1,1]]
    @epsilon = 0.05
    @w10 = 0.5
    @w20 = 0.5
    @w11 =  1.0
    @w12 = -0.5
    @w21 = -0.5
    @w22 = 1.0 
    @v0 = rand(0.5...1.0)
    @v1 = rand(-0.5...0.5)
    @v2 = rand(-0.5...0.5)
    puts "initial values: v1: #{@v1}, v2: #{@v2}"
  end

end

