defmodule FbManagerNoOtpTest do
  use ExUnit.Case
  doctest FbManagerNoOtp

  test "starts with an empty roster" do
    {:ok, pid} = FbManagerNoOtp.start
    assert FbManagerNoOtp.roster(pid) == %{}
  end
end
