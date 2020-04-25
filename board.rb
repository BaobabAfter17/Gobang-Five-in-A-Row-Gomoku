
class Board 
    def initialize(n) # n >= 5
        @grid=Array.new(n){Array.new(n,"_")}
        @n=n 
    end    

    def valid?(position)
        ((0...@n).include?(position.first)) && ((0...@n).include?(position.last))
    end

    def empty?(position)
        @grid[position.first][position.last]=="_"
    end

    def place_mark(position,mark)
       if self.valid?(position) && self.empty?(position)
          @grid[position.first][position.last]=mark
       else
        raise "not valid position!"
       end
    end    

    def print_grid
        title = []
        (0...@n).each {|i| title << i % 10}
        puts "  " + title.join(" ")

        @grid.each_with_index do |sub_arr, j|
            puts (j % 10).to_s + " " + sub_arr.join(" ") + " " + (j % 10).to_s
        end

        puts "  " + title.join(" ")       
    end

    def win_row?(mark, sub_grid) # specific for a sub grid of 5 * 5
        sub_grid.any? do |sub_arr|
            sub_arr.all?(mark)
        end
    end

    def win_col?(mark, sub_grid) # specific for a sub grid of 5 * 5
        sub_grid.transpose.any? do |sub_arr|
            sub_arr.all?(mark)
        end
    end

    def win_diagonal?(mark, sub_grid) # specific for a sub grid of 5 * 5
        (0...sub_grid.length).all? {|i| @grid[i][i] == mark} || (0...@grid.length).all? {|i| @grid[i][-i - 1] == mark}
    end

    def win?(mark) # should applied to all sub grid
        (0..@n - 5).each do |i|
            (0..@n - 5).each do |j|
                sub_grid = Array.new(5) {[]}
                sub_grid.map!.with_index {|subarr, k| @grid[i + k][j..j + 4]}
                # print sub_grid
                # puts
                if self.win_row?(mark, sub_grid) || self.win_col?(mark, sub_grid) || self.win_diagonal?(mark, sub_grid)
                    return true
                end
            end
        end
        false
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end


end


