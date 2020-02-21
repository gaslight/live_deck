defmodule LiveDeck.Controls.Control do
  @moduledoc """
  Implements an Agent that stores
  a presentation struct.

  This module also exposes functions that
  let callers manipulate the presentation
  struct stored in state and fetch data
  from the Agent.
  """
  use Agent
  alias LiveDeck.Presentations

  @spec start_link() :: Agent.on_start()
  def start_link do
    Agent.start_link(fn -> Presentations.load() end, name: __MODULE__)
  end

  @spec get_presentation() :: Presentations.presentation()
  def get_presentation do
    Agent.get(__MODULE__, & &1)
  end
end