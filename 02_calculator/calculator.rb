#write your code here
def add num1, num2
    num1 + num2
end

def subtract num1, num2
    num1 - num2
end

def sum vec
    var_sum = 0
    vec.each do |num|
        var_sum += num
    end
    var_sum
end

def multiply num1, num2
    num1 * num2
end

def power val1, val2
    val1**val2
end

def factorial val
    fac = 1
    val.times do |x|
        fac *= x + 1
    end
    fac
end