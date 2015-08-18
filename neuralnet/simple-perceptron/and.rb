require './perceptron.rb'

class AndPerceptron < Perceptron
  # attr_accessor x1,x2,w10,w11,w12,w20,w21,w22,v0,v1,v2,a1,a2,y
  #w10,w20(h1,h2): 中間層しきい値 : 0.5 固定
  #v0(theta1): 出力層しきい値: 0.5 ~ 1.0の任意の値で初期化
  #w11,w12,w21,w22: 中間層結合荷重
  #v1,v2: 出力層結合荷重: -0.5 ~ 0.5 の任意の値で初期化
  #a1,a2: 中間層出力 : 0 or 1
  #y: 出力層出力 (0 or 1)
  #t: 教師信号(0 or 1)
  # @@epsilon = 0.7
  @@epsilon = 0.05
  @@train_set  = [[0,0,0],[0,1,0],[1,0,0],[1,1,1]]
  @@test_set = [[0,0,0],[0,1,0],[1,0,0],[1,1,1]]
  @@w10 = 0.5
  @@w20 = 0.5
  @@w11 =  1.0
  @@w12 = -0.5
  @@w21 = -0.5
  @@w22 = 1.0 
  
  #[x1,x2,t]=[0,0,0],[0,1,0],[1,0,0],[1,1,1]
  def initialize
    @v0 = rand(0.5...1.0)
    @v1 = rand(0...1.0)
    @v2 = rand(0...1.0)
    puts "initial values: v1: #{@v1}, v2: #{@v2}"
  end

  def single_train(datum,index)
      x1 = datum[0]
      x2 = datum[1]
      t = datum[2]
      a1 = (@@w11*x1+@@w12*x2-@@w10) > 0 ? 1 : 0
      a2 = (@@w21*x1+@@w22*x2-@@w20) > 0 ? 1 : 0
      y = (@v1*a1+@v2*a2-@v0) > 0 ? 1 : 0
      dv1 = @@epsilon*(t-y)*a1
      dv2 = @@epsilon*(t-y)*a2
      @v1 = @v1 + dv1 
      @v2 = @v2 + dv2 
      # if ((t-y) != 0)
      #   puts "penalty: a1:#{a1} a2:#{a2}, t:#{t}, y:#{y}"
      #   puts "trained #{index} times: dv1: #{dv1}, dv2: #{dv2}"
      # end
  end

  def train
    # @train_datum = @@train_set.sample
    # single_train(@train_datum)
    @train_data = []
    10000.times do
      @train_data << @@train_set.sample
    end

    @train_data.each_with_index do |datum,index|
      single_train(datum,index)
    end
    puts "train completed: v1: #{@v1}, v2: #{@v2}"
  end

  def test
    @@test_set.each do |datum|
      single_test(datum)
    end
  end

  def single_test(datum)
    x1 = datum[0]
    x2 = datum[1]
    t = datum[2]
    a1 = (@@w11*x1+@@w12*x2-@@w10) > 0 ? 1 : 0
    a2 = (@@w21*x1+@@w22*x2-@@w20) > 0 ? 1 : 0
    y = (@v1*a1+@v2*a2-@v0) > 0 ? 1 : 0
    puts "x1 = #{x1}, x2 = #{x2}, t = #{t}, y = #{y}"
  end

end

a = AndPerceptron.new
a.train
a.test


