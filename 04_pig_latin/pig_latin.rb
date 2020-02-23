#write your code here
def translate text
    vowels = ["a","e","i","o","u"]
    text.downcase.split(" ").map{|word|
        pos_temp = 0
        pos_vocal = nil
        word.split(//).collect do |let|
            pos_vocal ||= pos_temp if vowels.include?(let)
            pos_temp +=1
        end
        if(pos_vocal==0)
            "#{word}ay"    
        else
            if(word[pos_vocal-1..pos_vocal]=="qu")
                "#{word[pos_vocal+1..-1]}#{word[0..pos_vocal]}ay"
            else
                "#{word[pos_vocal..-1]}#{word[0..pos_vocal-1]}ay"
            end
        end
    }.join(" ")
end