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
        player = FFNerd.Player.find(name, client)

        new_state = Map.put(state, name, player)
        
        loop(new_state)
      
      {:remove, name} ->
        new_state = Map.delete(state, name)

        loop(new_state)
      
      {:team, pid} ->
        send(pid, {:ok, state})

        loop(state)

      {_, pid} ->
        send(pid, {:error})

        loop(state)
    end
  end
end
