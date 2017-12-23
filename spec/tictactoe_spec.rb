require "tictactoe.rb"

describe TicTacToe do
  subject(:ttt){TicTacToe.new}

  describe "win conditions." do
    context "given top horizontal win condition"do
      it "triggers game over" do
        ttt.board.game_board[0][0] = "X"
        ttt.board.game_board[0][1] = "X"
        ttt.board.game_board[0][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given middle horizontal win condition" do
      it "triggers game over" do
        ttt.board.game_board[1][0] = "X"
        ttt.board.game_board[1][1] = "X"
        ttt.board.game_board[1][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given bottom horizontal win condition" do
      it "triggers game over" do
        ttt.board.game_board[2][0] = "X"
        ttt.board.game_board[2][1] = "X"
        ttt.board.game_board[2][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given left to right diagonal win condition" do
      it "triggers game over" do
        ttt.board.game_board[0][0] = "X"
        ttt.board.game_board[1][1] = "X"
        ttt.board.game_board[2][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given right to left diagonal win condition" do
      it "triggers game over" do
        ttt.board.game_board[2][0] = "X"
        ttt.board.game_board[1][1] = "X"
        ttt.board.game_board[0][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given left vertical win condition" do
      it "triggers game over" do
        ttt.board.game_board[0][0] = "X"
        ttt.board.game_board[1][0] = "X"
        ttt.board.game_board[2][0] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given centre vertical win condition" do
      it "triggers game over" do
        ttt.board.game_board[0][1] = "X"
        ttt.board.game_board[1][1] = "X"
        ttt.board.game_board[2][1] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

    context "given right vertical win condition" do
      it "triggers game over" do
        ttt.board.game_board[0][2] = "X"
        ttt.board.game_board[1][2] = "X"
        ttt.board.game_board[2][2] = "X"
        expect(ttt.is_game_over?).to be(true)
      end
    end

  end

  describe "validating moves" do

    context "given '[1,2]' as input" do
      it "returns false" do
        expect(ttt.player1.valid_coord?([1,2])).to be(true)
      end
    end

  end

  describe "switching players mechanic" do
    it "changes active player" do
        ttt.switch_players
        expect(ttt.active_player).to eq(ttt.player2)
    end
  end

  describe "#add_turn" do
    it "adds a new position and updates board" do
      ttt.board.add_turn([0,0], "X")
      expect(ttt.board.game_board[0][0]).to eq("X")
    end
  end

end
