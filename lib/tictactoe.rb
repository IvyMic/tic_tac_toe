class TicTacToe

  #create board and the two players
  #and set active player
  attr_accessor :board
  attr_reader :player1, :player2, :active_player
  def initialize()
    @board = Board.new()
    @player1 = Player.new("Player 1", "X", @board)
    @player2 = Player.new("Player 2", "O", @board)
    @active_player = @player1
  end

  #game loop
  def start_game
    loop do
      @board.render_board

      @active_player.player_move

      if is_game_over?
        @board.render_board
        break
      end

      switch_players
    end
  end

  def is_game_over?
    if check_vic || check_draw
      true
    end
  end

  def check_vic
    if @board.victory?(@active_player.type)
      puts "Congrats #{@active_player.name}, you are victorious!"
      return true
    end
  end

  def check_draw
    if @board.draw?(@active_player.type)
      puts "tictac Tie!."
      return true
    end
  end

  def switch_players
    if @active_player == @player1
      @active_player = @player2
    else
      @active_player = @player1
    end
  end

end

class Player
  #board is linked to the player via tictactoe class
  #type is whether player is x or o
  attr_accessor :name, :type
  def initialize(name, type, board)
    @name = name
    @type = type
    @board = board
  end

  # loop through getting the coord from player
  #checking if coord is valid (add_turn also checks stuff), and then
  #adding to the board and breaking the loop
  def player_move
    loop do
      player_coord = get_coord
      if valid_coord?(player_coord)
        if @board.add_turn(player_coord, @type)
          break
        end
      end

    end
  end

  #gets coord from player, and converts it into usable array
  #TO DO: split the converting part to a different function
  def get_coord
    puts "#{@name}, where would you like to play? Enter your coordinates.
    For example, if you want enter your piece on the first row, second column,
    You should type: 1,2
    and then hit enter"
    player_coord = gets.strip.split(",").map { |coord| coord.to_i-1}
  end

  #checking if coord is in correct format
  def valid_coord?(player_coord)
    if (player_coord.size == 2) && (player_coord.is_a?(Array))
       true
    else
      puts "Please follow the format when entering your coordinates!"
    end
  end
end

class Board
    #each square in the board can be empty or have a type.
    #default is set to empty
    #turn counter
    @@turns = 0
    attr_accessor :game_board
    def initialize
      @game_board = [[" "," "," "],
               [" "," "," "],
               [" "," "," "]
              ]
    end

    #make board look kind of like an actual game of tictactoe
    def render_board
      puts @game_board.map { |row| row.join(" | ")}.join("\n")
      puts
    end

    #check if board is full
    def full_board?
      if @@turns >= 9
        return true
      end
    end

    #check if coord is in valid range
    def valid_range?(player_coord)
      if (0..2).include?(player_coord[0] && player_coord[1])
        return true
      else
        #display error message
        puts "that is not on the board. try again"
      end
    end

    #check if position is empty
    def available_position?(player_coord)
      if @game_board[player_coord[0]][player_coord[1]] == " "
        true
      else
        #error message
        puts "That position is already taken \n"
      end
    end

    #if player coord passes tests, add it to the board
    def add_turn(player_coord, type)
      if valid_range?(player_coord)
        if available_position?(player_coord)
          @game_board[player_coord[0]][player_coord[1]] = type
          @@turns += 1
        end
      end
    end


    def victory?(type)
      horizontal_vic?(type) || vertical_vic?(type) || diagonal_vic?(type)
    end

    def draw?(type)
      if (full_board?) && (victory?(type) == false)
        return true
      end
    end

    def horizontal_vic? (type)
      #horizontal win combos
      horizontal_array = [[ @game_board[0][0],@game_board[0][1],@game_board[0][2]],[ @game_board[1][0],@game_board[1][1],@game_board[1][2]],[ @game_board[2][0],@game_board[2][1],@game_board[2][2] ]]
      #cycle through, and return true if
      #all of the values in the array, in each win-combo, equals type
      horizontal_array.any? do |win_cond|
        win_cond.all?{|cell| cell == type}
      end
    end


    def vertical_vic? (type)
      vertical_array = [[ @game_board[0][0],@game_board[1][0],@game_board[2][0]],[ @game_board[0][1],@game_board[1][1],@game_board[2][1]],[ @game_board[0][2],@game_board[1][2],@game_board[2][2] ]]

      vertical_array.any? do |win_cond|
        win_cond.all?{|cell| cell == type}
      end
    end

    def diagonal_vic? (type)
      diagonal_array = [[ @game_board[0][0],@game_board[1][1],@game_board[2][2] ],[ @game_board[2][0],@game_board[1][1],@game_board[0][2] ]]
      diagonal_array.any? do |win_cond|
          win_cond.all?{|cell| cell == type }
      end
    end

end
