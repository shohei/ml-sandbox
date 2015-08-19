require 'csv'

module Perceptron 
  class Base 
    #w10,w20(h1,h2): 中間層しきい値 : 0.5 固定
    #v0(theta1): 出力層しきい値: 0.5 ~ 1.0の任意の値で初期化
    #w11,w12,w21,w22: 中間層結合荷重
    #v1,v2: 出力層結合荷重: -0.5 ~ 0.5 の任意の値で初期化
    #a1,a2: 中間層出力 : 0 or 1
    #y: 出力層出力 (0 or 1)
    #t: 教師信号(0 or 1)

    def sigmoid(x)
      return 1.0/(1+Math.exp(-x))
    end

    def compute_second_weights(x1,x2,t)
      @h1 = sigmoid(@w11*x1+@w12*x2-@w10)
      @h2 = sigmoid(@w21*x1+@w22*x2-@w20)

      @o1 = sigmoid(@v1*@h1+@v2*@h2-@v0)

      dv0 = @eta*(t-@o1)*@o1*(1-@o1)*@h0
      dv1 = @eta*(t-@o1)*@o1*(1-@o1)*@h1
      dv2 = @eta*(t-@o1)*@o1*(1-@o1)*@h2
      @v0 = @v0 + dv0
      @v1 = @v1 + dv1 
      @v2 = @v2 + dv2 

    end

    def compute_first_weights(x1,x2,t)
      @dw10 = @eta*(t-@o1)*@o1*(1-@o1)*@v1*@h1*(1-@h1)*@x0
      @dw11 = @eta*(t-@o1)*@o1*(1-@o1)*@v1*@h1*(1-@h1)*x1
      @dw12 = @eta*(t-@o1)*@o1*(1-@o1)*@v1*@h1*(1-@h1)*x2

      @dw20 = @eta*(t-@o1)*@o1*(1-@o1)*@v2*@h2*(1-@h2)*@x0
      @dw21 = @eta*(t-@o1)*@o1*(1-@o1)*@v2*@h2*(1-@h2)*x1
      @dw22 = @eta*(t-@o1)*@o1*(1-@o1)*@v2*@h2*(1-@h2)*x2

      @w10 = @w10 + @dw10
      @w11 = @w11 + @dw11
      @w12 = @w12 + @dw12
      @w20 = @w20 + @dw20
      @w21 = @w21 + @dw21
      @w22 = @w22 + @dw22
    end

    def single_train(x1,x2,t)
      compute_second_weights(x1,x2,t)
      compute_first_weights(x1,x2,t)
    end

    def converged(t)
      error = [@dw10,@dw11,@dw12,@dw20,@dw21,@dw22].map{|a| a.abs}.max
      if(error < @eta*@stop)
        puts "Ending loop in #{@count} times"
        puts "Computed values: "
        puts "               v0:#{@v0}, v1: #{@v1}, v2: #{@v2}"
        puts "               w10:#{@w10}, w11: #{@w11}, w12: #{@w12}"
        puts "               w20:#{@w20}, w21: #{@w21}, w22: #{@w22}"
        puts "Final error: #{error}"
        return true 
      else
        return false 
      end
    end

    def train
      CSV.open("output.csv","w") do |csv|
        csv << %w(count v0 v1 v2 w10 w11 w12 w20 w21 w22)
        @count = 0
        loop do
          @train_data = @train_set.sample
          @x1 = @train_data[0]
          @x2 = @train_data[1]
          @t = @train_data[2]
          single_train(@x1,@x2,@t)
          csv << [@count,@v0,@v1,@v2,@w10,@w11,@w12,@w20,@w21,@w22]
          break if converged(@t)
          @count += 1
        end
      end
  
        # puts "train completed: v1: #{@v1}, v2: #{@v2}"
        puts "train completed"
    end

    def test
      @test_set.each do |datum|
        single_test(datum)
      end
    end

    def single_test(datum)
      x1 = datum[0]
      x2 = datum[1]
      t = datum[2]
      h1 = sigmoid(@w11*x1+@w12*x2-@w10)
      h2 = sigmoid(@w21*x1+@w22*x2-@w20)
      y = sigmoid(@v1*h1+@v2*h2-@v0) 
      # result = (y==t) ? "OK" : "NG"
      # puts "x1 = #{x1}, x2 = #{x2}, t = #{t}, y = #{y}  ### [ #{result} ] ###"
      puts "x1 = #{x1}, x2 = #{x2}, t = #{t}, y = #{y}" 
    end
  end
end
