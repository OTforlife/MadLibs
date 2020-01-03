class MadLib
    attr_accessor :testUserAnswer

    def initialize
        @key_words = []
    end

    def scan_string input
        counter = 0
        @input = input
        input_copy = String.new(@input)
        while input_copy.include? "{{"
            begins_spot = input_copy.index("{{")
            end_spot = input_copy.index("}}")
            spot_length = end_spot - begins_spot + 2
            sub_string = input_copy[begins_spot, spot_length]
            @key_words << sub_string
            input_copy.gsub! sub_string, ""

            counter += 1 
        end
        return @key_words
    end

    def replace userAnswer  #functions snakecase, Class pascal
        counter = 0
        output = @input
        while output.include? "{{"
            begins_spot = output.index("{{")
            end_spot = output.index("}}")
            spot_length = end_spot - begins_spot + 2
            sub_string = output[begins_spot, spot_length]
            # @subs[sub_string] = @testUserAnswer[counter]
            output.gsub! sub_string, userAnswer[counter]

            counter += 1 
        end
        return output  #usually new variable
    end

end
