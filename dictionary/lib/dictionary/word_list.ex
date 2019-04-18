defmodule Dictionary.WordList do

  @me __MODULE__	
  #this is a module attribute	

  #we use agent to keep data in memory with some state
  #in this case to avoid disk reads because word_list function
  #{:ok, agent_pid} = Agent.start_link(<fn>)
  def start_link() do

    #a way to pass defined functions to agents
    # also, a name can be passed
    Agent.start_link(&word_list/0 , name: @me)
  end

  def random_word() do
		Agent.get(@me,&Enum.random/1)
  end
  
  #Path.expand(__DIR__) to look for file in the dir of this project
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
