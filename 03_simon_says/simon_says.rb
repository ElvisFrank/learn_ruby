#write your code here
def echo greeting
    greeting
end

def shout greeting
    greeting.upcase
end

def repeat greeting, rep = 2
    str = greeting
    rep -= 1
    rep.times do |greet|
        str += " #{greeting}"
    end
    str
end

def start_of_word greeting, pos
    greeting[0..pos-1]
end

def first_word word
    (word.split)[0]
end

def titleize title
    bams = ["over"]
    title.capitalize.split(" ").map{|wrd| (wrd.length < 4 || bams.include?(wrd)) ? wrd : wrd.capitalize}.join(' ')
end