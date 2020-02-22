class Book
# write your code here
    attr_writer :title
    
    def initialize;end

    def title
        words = @title.split
        @title = words[0].capitalize
        if !words[1].nil?
            @title += " " + words[1..-1].map{|word|
                ignore_word.include?(word) ? word : word.capitalize
            }.join(" ")
        end
        @title
    end

    private def ignore_word
        ["the", "a", "an", "in", "of", "and"]
    end
end
