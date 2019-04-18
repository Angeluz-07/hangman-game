defmodule TextClient.Interact do

	#change 'test-VirtualBox' by name of current host
	@hangman_server :hangman@testvbox
	
	#alias works to refer "TextClient.State" just as "State"
	alias TextClient.State
	alias TextClient.Player
	#same as "alias TextClient.{Player, State}"

	def start() do
		new_game()
		|> setup_state()
		|> Player.play()

		#IO.inspect() works to print out what is going trough the pipe
	end

	defp setup_state(game_service)	do
		%State{
			game_service: game_service,
			tally:				Hangman.tally(game_service),
		}
	end

	defp new_game() do
    		Node.connect(@hangman_server)
    		:rpc.call(@hangman_server, Hangman,:new_game,[])
	end
end
