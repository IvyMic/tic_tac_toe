class Board
    #each square in the board can be empty or have a type.
    #default is set to empty
    attr_accessor :board
    def initialize
      @board = [["X"," "," "],
               [" ","O"," "],
               [" "," ","X"]
              ]

    end


    def render_board
      @board.map { |row|
        row.join(" | ")
      }.join("\n")
    end

    def add_turn

    end

end
