defmodule Hangman.Server do

  alias Hangman.Game
  #to use GenServer
  #in erlang we would need to write several non-used interfaces, just to make erlang compile
  #in other terms, you tell elixir that a module implements the GenServer Behaviour
  use   GenServer

  #run this as a new separate process?
  def start_link() do
    #We pass the module to run as genserver, in this case the current module "__MODULE__"
    #as no args we pass nil
    GenServer.start_link(__MODULE__, nil)
  end

  #init is supposed to return a state
  #variables are used to build that state, but in this case we don't use them

  #after GenServer is started with start_link, GenServer Framework calls this functions to make the init state
  def init(_) do
    { :ok, Game.new_game() }
  end

  #to respond the call of GenServer(pid,{:make_move,guess})
  #while using this, externally we don't care about passing the state over and over again that is held inside the server
  def handle_call({ :make_move, guess }, _from, game) do
    { game, tally } = Game.make_move(game, guess)
    { :reply, tally, game }
  end
  
   def handle_call({ :tally }, _from, game) do
    { :reply, Game.tally(game), game }
  end
  
end
