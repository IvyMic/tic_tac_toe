=begin



  TicTacToe game with two players from the command line.
   Setup game (TicTacToe class)
      create the board (board class)
      create two players (player class)
    Start game, start loop
      display board
      get user input on board
      validate user input
      display user input
    if win condition met
      display victory message, restart game
    if draw
        display draw message, restart game
    else
        next players turn and keep looping


class TicTacToe
  initialize
    make board object = done
    make two player objects = done

  start game
    loop
      display the board, with any updates to it included
      get user coordinates from the active player
      break loop if game is over
      switch players

  check if game is over
    check for victory
    check for draw

  check victory
    if board says that active player has a winning combo show victorymessage

  check draw = done
    if 9 moves are played in total AND victory is false display draw message

  switchPlayers = done
    Active player becomes inactive player

  class Player
    initialize = done
      give player name and their type (x or O)

    get user input for coordinates
      loop
        ask for coord
        if valid coordinates
          if it can be placed on board
            break loop and send values to board

    asking for coord = done
      display message asking for coord
      save user input

    check if valid coord = done
      if code is not in valid format, display error
  end

  class Board
    initialize
      make blank object

    display
      loop through and display x o or blank

    add type
      check if type is valid
        check if location is valid
          add type else display error

    checking location
      check if valid coord
        check if place is available

    checking if valid coord
      if coord in acceptable range, good
      else error

    check if place is available
      if space is occupied, error


    victory?
      diagonal vic?
      horizontal vic?
      vertical vic?

    diagonalvic?

  end
end
=end
