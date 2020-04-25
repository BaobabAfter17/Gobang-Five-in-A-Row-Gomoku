require_relative './board.rb'
require_relative './human_player.rb'

class Game
    attr_reader :players, :current_player, :board
    def initialize(n,mark_1, mark_2)
        @player_1=HumanPlayer.new(mark_1)
        @player_2=HumanPlayer.new(mark_2)
        @current_player=@player_1
        @board=Board.new(n)
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print_grid
            puts "#{@current_player.mark_value}, your turn!"
            current_position=@current_player.get_position
            current_mark=@current_player.mark_value
            @board.place_mark(current_position,current_mark)
            if @board.win?(current_mark)
                puts "#{@current_player}, you won!"
                @board.print_grid
                return true
            else
                self.switch_turn
            end
        end
        puts "draw!"
    end
end

g = Game.new(15, :X, :O)
g.play

