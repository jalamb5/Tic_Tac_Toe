module WINCONDITION
    def is_winner?
        winning_configs = [[2, 4, 6], [10, 12, 14], [18, 20, 22], # Rows
                        [2, 10, 18], [4, 12, 20], [6, 14, 22], # Columns
                        [2, 12, 22], [6, 12, 18]] # Diags
        winner = ''
        winning_configs.each do |config|
            config_checker = []
            config.each do |location|
                config_checker << @board[location]
            end
            if config_checker.uniq == ['X']
                winner = 'X'
                return true
                return winner
            elsif config_checker.uniq == ['O']
                winner = 'O'
                return true
                return winner
            else
                return false
            end
        end
    end
end

class Board
    attr_accessor :board, :coords
    def initialize
        self.board = "\n|_|_|_|\n|_|_|_|\n|_|_|_|\n"
        puts self.board
        self.coords = "\n| 2| 4| 6|\n|10|12|14|\n|18|20|22|\n"
        puts self.coords
    end

    def mark(player, move_location)
        puts self.board

        self.board[move_location] = player
        puts self.board
    end

    include WINCONDITION

end



def game
     puts "Welcome to Tic-Tac-Toe"
     puts "Player X, please enter your name: "
     player_x = gets.strip
     puts "Player O, please enter your name: "
     player_o = gets.strip

    game_board = Board.new()

    while !game_board.is_winner?
        puts "#{player_x}, where will you move?"
        x_move = gets.strip
        game_board.mark('X', x_move.to_i)
        puts "#{player_o}, where will you move?"
        o_move = gets.strip
        game_board.mark('O', o_move.to_i)
    end
    puts "Winner is: #{winner}"
end



game()