defmodule TextClient.State do

	#a module just to hold a struct

	defstruct(
		game_service: nil,
		tally:				nil,
		guessed:			"",
	)

end
