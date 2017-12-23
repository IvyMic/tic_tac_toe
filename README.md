Pre thoughts
---------------------

This is my first attempt at object oriented programming, and I am particularly excited about programming something that I could show to people.


Things I'm concerned about:

1) How on earth do you draw the gameboard on the command line?

2) switching turns so that two people play

3) vetting user input

4) Most important: Not having a 'God' class.

Things I'm confident about:

1) Because two people play the exact same way, i don't need to repeat code. implement one structure that both players use

2) win conditions are straightforward, and so to is the draw condition.


Post thoughts
---------------------

I'm really pleased at completing this project.
After asking around I found out that you're supposed to draw the board every turn with characters such as "|". I honestly can't believe I thought there was some sort of way to download a GUI for the command line or something... how silly of me!

Switching users was also a simpler task than I thought it was going to be.

Vetting user input was simple but tiresome, and not really fun to code.

Things to improve on in the future:

1) My classes are all on one file, and its better to have 'player.rb' file for example and require them all in the main file

2) I should use the '?' operator more if I can, and also refactor the simple if statements to one line


---------------------

I came back to this and added some basic rspec testing. This is my first time getting
used to rspec. I hope to use it in the future to do some TDD.
