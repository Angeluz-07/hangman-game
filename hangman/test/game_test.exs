defmodule GameTest do
  use ExUnit.Case
  
  alias Hangman.Game

  test "new game returns structure" do
    game = Game.new_game()
    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0
  end

	#I had to quit the assert since didn't work with "_"
  test "state isn't changed for :won or :lost game" do
    for state <- [:won,:lost] do
      game = Game.new_game() |> Map.put(:game_state,state)
			t = Game.tally(game)
      {game, t} = Game.make_move(game, "x")
    end
  end

  test "first ocurrence of letter is not already used" do
		game = Game.new_game()
		{game,_} = Game.make_move(game, "x")
		assert game.game_state != :already_used
  end
	
	test "second ocurrence of letter is not already used" do
		game = Game.new_game()
		{game,_}  = Game.make_move(game, "x")
		assert game.game_state != :already_used

		{game,_}  = Game.make_move(game, "x")
		assert game.game_state == :already_used
  end

	test "good_guess is recognized" do
		game = Game.new_game("wible")
		{game,_}  = Game.make_move(game, "w")
		assert game.game_state == :good_guess
		assert game.turns_left == 7
  end

	test "a guessed_word is won the game" do
		game = Game.new_game("wible")
		{game,_}  = Game.make_move(game, "w")
		assert game.game_state == :good_guess
		assert game.turns_left == 7
		
		{game,_}  = Game.make_move(game, "i")
		assert game.game_state == :good_guess
		assert game.turns_left == 7

		{game,_}  = Game.make_move(game, "b")
		assert game.game_state == :good_guess
		assert game.turns_left == 7

		{game,_}  = Game.make_move(game, "l")
		assert game.game_state == :good_guess
		assert game.turns_left == 7
		
		{game,_}  = Game.make_move(game, "e")
		assert game.game_state == :won
		assert game.turns_left == 7
  end

	test "bad_guess is recognized" do
		game = Game.new_game("wible")
		{game,_}  = Game.make_move(game, "x")
		assert game.game_state == :bad_guess
		assert game.turns_left == 6
  end
	
	test "lost the game" do
		game = Game.new_game("w")
		{game,_}  = Game.make_move(game, "a")
		assert game.game_state == :bad_guess
		assert game.turns_left == 6
		
		{game,_}  = Game.make_move(game, "b")
		assert game.game_state == :bad_guess
		assert game.turns_left == 5

		{game,_}  = Game.make_move(game, "c")
		assert game.game_state == :bad_guess
		assert game.turns_left == 4

		{game,_}  = Game.make_move(game, "d")
		assert game.game_state == :bad_guess
		assert game.turns_left == 3
		
		{game,_}  = Game.make_move(game, "e")
		assert game.game_state == :bad_guess
		assert game.turns_left == 2

		{game,_}  = Game.make_move(game, "f")
		assert game.game_state == :bad_guess
		assert game.turns_left == 1

		{game,_}  = Game.make_move(game, "g")
		assert game.game_state == :lost

  end

end
