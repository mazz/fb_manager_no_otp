defmodule FbManagerNoOtpTest do
  use ExUnit.Case
  doctest FbManagerNoOtp

  test "starts with an empty roster" do
    {:ok, pid} = FbManagerNoOtp.start
    assert FbManagerNoOtp.roster(pid) == %{}
  end

  test "can add a player" do
    {:ok, pid} = FbManagerNoOtp.start
    FbManagerNoOtp.add_player(pid, "Russell Wilson")
    
    russell_wilson = %FFNerd.Player{active: "1", college: "",
    display_name: "Russell Wilson", dob: "0000-00-00", fname: "Russell",
    height: "", jersey: "3", lname: "Wilson", player_id: "1847", position: "QB",
    star: nil, team: "SEA", twitter_id: nil, weight: ""}

    assert FbManagerNoOtp.add_player(pid, "Russell Wilson") == russell_wilson

    # assert FbManagerNoOtp.roster(pid) != %{}
    
  end

  test "can find a player on the roster" do 
    {:ok, pid} = FbManagerNoOtp.start
    FbManagerNoOtp.add_player(pid, "Russell Wilson")
    assert FbManagerNoOtp.find(pid, "Russell Wilson") != nil
  end


  # test "can remove a player" do
  #   {:ok, pid} = FbManagerNoOtp.start
  #   FbManagerNoOtp.remove_player(pid, "Russell Wilson")
  # end
end
