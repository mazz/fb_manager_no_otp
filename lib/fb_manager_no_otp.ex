defmodule FbManagerNoOtp do

  @moduledoc """
  Documentation for FbManagerNoOtp.
  """
  def start_link() do
    spawn_link(__MODULE__, :loop, [%{}])
  end

  def loop(state) do
    receive do
      {:add, name} ->
        client = FFNerd.Client.new("hrqevq4h55mt")
        IO.inspect client
        IO.inspect name
        # FFNerd.Player.find("Russell Wilson", client)
        player = FFNerd.Player.find(name, client)
        IO.inspect player
        # new_state = Map.put(state, name, player)

        loop(state)
      
      {:remove, name} ->
        new_state = Map.delete(state, name)

        loop(state)
      
      {:team, pid} ->
        send(pid, {:ok, state})

        loop(state)
    end
  end
end
