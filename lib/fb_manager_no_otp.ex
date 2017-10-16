defmodule FbManagerNoOtp do

  @moduledoc """
  Documentation for FbManagerNoOtp.
  """

  def start() do
    {:ok, spawn_link(__MODULE__, :loop, [%{}])}
  end

  def roster(pid) do
    ref = make_ref()
    send(pid, {self(), ref, :roster})

    receive do
      {^ref, state} -> state
    end
  end

  def add_player(pid, add_name) do
    ref = make_ref()
    send(pid, {self(), ref, add_name, :add_player})

    # return back the player we just added
    receive do
      {^ref, player} -> player
    end
  end

  def find(pid, find_player) do
    ref = make_ref()
    send(pid, {self(), ref, find_player, :find})

    receive do
      {^ref, player} -> player
    end
  end

  def remove_player(pid, remove_player) do
    send(pid, {remove_player, :remove})
  end

  def loop(state) do
    receive do
      {from, ref, :roster} ->
        send(from, {ref, state})
        loop(state)

      {from, ref, name, :add_player} ->
        client = FFNerd.Client.new("hrqevq4h55mt")
        player = FFNerd.Player.find(name, client)
        new_state = Map.put(state, name, player)        
        send(from, {ref, player})
        loop(new_state)

      {from, ref, player, :find} ->
        found = Map.fetch(state, player)
        send(from, {ref, found})
        loop(state)

      {player, :remove} ->
        new_state = Map.delete(state, player)
        loop(new_state)
    end

  end


  # def loop(state) do
  #   receive do
  #     {:add, name} ->
  #       client = FFNerd.Client.new("hrqevq4h55mt")
  #       player = FFNerd.Player.find(name, client)
  #       # IO.inspect player
  #       new_state = Map.put(state, name, player)
        
  #       loop(new_state)
      
  #     {:remove, name} ->
  #       new_state = Map.delete(state, name)

  #       loop(new_state)
      
  #     {:team, pid} ->
  #       send(pid, {:ok, state})

  #       loop(state)

  #     {_, pid} ->
  #       send(pid, {:error})

  #       loop(state)
  #   end
  # end
end
