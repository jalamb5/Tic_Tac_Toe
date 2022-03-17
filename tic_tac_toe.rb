module WINCONDITION
    def keep_playing?
        winning_configs = [[2, 4, 6], [10, 12, 14], [18, 20, 22], #rows
        [2, 10, 18], [4, 12, 20], [6, 14, 22], #columns
        [2, 12, 22], [6, 12, 18]] #diags
        winning_configs.each do |config|
            config_checker = []
            config.each do |location|
                config_checker << self.board[location]
            end
            if config_checker.uniq == ['X']
                puts "Winner is X"
                return false
            elsif config_checker.uniq == ['O']
                puts "Winner is O"
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

    include WINCONDITION

    def mark(player, move_location)
        puts self.coords
        # Check if location is already in use
        invalid_selections = ["|", "\n", "X", "O"]
        if invalid_selections.include?(self.board[move_location])
            puts "Invalid selection. Choose an empty location: "
            move_location = gets.strip.to_i
            mark(player, move_location)
        else
            self.board[move_location] = player
            puts self.board
        end
    end
end

def play(board, player, name)
    puts "#{name}, where will you move?"
    move = gets.strip
    board.mark(player, move.to_i)
end

def game
     puts "Welcome to Tic-Tac-Toe"
     puts "Player X, please enter your name: "
     player_x = gets.strip
     puts "Player O, please enter your name: "
     player_o = gets.strip

    game_board = Board.new()
    playing = true

    players = [['X', player_x], ['O', player_o]]
    player_index = 0

    while playing do
        play(game_board, players[player_index][0], players[player_index][1])
        playing = game_board.keep_playing?
        player_index = player_index == 1 ? 0 : 1
    end
end

game()