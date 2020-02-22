class Timer
  #write your code here
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def time_string
    time_v = [0,0,0,0,0,0]
    @seconds.times do |x|
      (0..5).reverse_each do |i|
        if(i % 2 == 0)
          if(time_v[i] < 5)
            time_v[i] += 1
            break
          else
            time_v[i] = time_v[i+1] = 0            
          end
        else
            
          if(time_v[i] < 9)
            time_v[i] += 1
            break
          else
            time_v[i] = 0
          end
        end
      end
    end
    "#{time_v[0]}#{time_v[1]}:#{time_v[2]}#{time_v[3]}:#{time_v[4]}#{time_v[5]}"
  end
end
