class HumanPlayer
attr_reader :mark_value
    def initialize(mark_value)
        @mark_value=mark_value
    end

    def get_position
        puts "Pick a spot. You should describe your spot as '2 3'."
        user_input=gets.chomp.split(" ").map(&:to_i)
        if user_input.length != 2
            raise "invalid format!"
        else
            return user_input
        end
    end
end