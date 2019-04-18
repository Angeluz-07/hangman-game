# TextClient

From ./hangman project in one terminal run `iex --sname hangman -S mix`
From ./text_client in another(s) terminal(s) run `iex --sname clientN -S mix` and then `TextClient.start`
(the last line doesn't work fully, maybe some trouble about ports)

Run :observer.start() to see how new servers are attached per client
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `text_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:text_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/text_client](https://hexdocs.pm/text_client).

