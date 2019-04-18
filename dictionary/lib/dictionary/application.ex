defmodule Dictionary.Application do

  #the below is like a format to use built-in elixir way to publish applications

  use Application
  
  def start(_type, _args) do
   
    import Supervisor.Spec

    children = [
      worker(Dictionary.WordList, []),
    ]
    
    options = [
      name:     Dictionary.Supervisor,
      strategy: :one_for_one,
    ]    

    #we pass a list of children to supervise
    #we pass a list of options to supervise those children

    Supervisor.start_link(children, options)
    #Dictionary.WordList.start_link() where does this left??, How is the function in application.ex called?
    #answer: by looking for a function called start_link().
  end

end
