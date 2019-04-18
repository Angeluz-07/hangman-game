defmodule Hangman do

  # could have used 
  # 'alias Hangman.Game, as: Wombat'
  # but left as such, I can refer to the sub-module as what is 
  # after the dot, in this case 'Game'

  #alias Hangman.Game

  #it will look for the new_game() function in 'Game' sub-module
  #defdelegate new_game(), to: Game
  #defdelegate tally(game), to: Game
  #defdelegate make_move(game,guess), to: Game

  #below is the api to implement genserver  
  def new_game() do
    { :ok, pid } = Supervisor.start_child(Hangman.Supervisor, [])
    pid
  end
  
  def tally(game_pid) do
    GenServer.call(game_pid, { :tally })
  end
  
  def make_move(game_pid, guess) do
    GenServer.call(game_pid, { :make_move, guess })
  end

end
