class Substrings
    def self.substrings words, dictionary
        result_hash = Hash.new #words = words.split(/[,\s\!\?]+/)
        words.chars.each_with_index do |letter, index|
            next if letter =~ (/[,\s\!\?\']+/)
            dictionary.each do |word|
                new_index = index + word.length - 1
                next unless words[index..new_index] =~ /#{word}/i
                result_hash[word] = result_hash[word].nil? ? 1 : result_hash[word] + 1                
            end
        end
        result_hash
    end

end