class CesarCipher
    def self.encrypt str, key
        0.upto(str.length-1) do |pos|
            str[pos] = add_letter str[pos],key
        end
        return str
    end    
    def self.decrypt str, key
        self.encrypt str, -key
    end
    
    def self.encrypt_1 str, key
        return str if key==0 || !(key.is_a? Numeric)
        str.chars.map do |letter|
            unless !!(letter =~ /[A-Za-z]/)
                letter
            else
                mod = !!(letter =~ /[A-Z]/) ? 65 : 97
                letter_ascii = letter.ord
                ((letter_ascii - mod + key) % 26 + mod).chr
            end
        end.join()
    end
    def self.decrypt_1 str, key
        self.encrypt_1 str, -key
    end
    
    def self.encrypt_2 str, key
        return str if key==0 || !(key.is_a? Numeric)
        str.chars.map.with_index do |letter, index|
            if !!(letter =~ /[A-Za-z]/)
                mod = !!(letter =~ /[A-Z]/) ? 65 : 97
                letter_ascii = letter.ord
                str[index] = ((letter_ascii - mod + key) % 26 + mod).chr
            end
        end
        str
    end
    def self.decrypt_2 str, key
        self.encrypt_2 str, -key
    end

    private
    def self.add_letter letter, add
        return letter unless (letter.length == 1 && !!(letter =~ /[A-Za-z]/))

        letters = (!!(letter =~ /[A-Z]/))? ('A'..'Z').to_a.join('') : ('a'..'z').to_a.join('')
        actual_position = letters.index(letter)
        mod = (actual_position + add) % letters.length

        return letters[mod]
    end

end

#p CesarCipher.encrypt('What a string!', 5)
#p CesarCipher.decrypt('Bmfy f xywnsl!', 5)
#puts add_letter 'B', 25
