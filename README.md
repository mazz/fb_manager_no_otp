# FbManagerNoOtp

Code based on "Intro to OTP In Elixir" (https://www.youtube.com/watch?v=CJT8wPnmjTM)

A small application wrapper for https://www.fantasyfootballnerd.com/. Uses the the ffnerd-api-elixir elixir API(https://github.com/jessejanderson/ffnerd-api-elixir). This application does NOT use OTP.

## Getting Started

Clone the repo locally
```sh
git clone https://github.com/mazz/fb_manager_no_otp.git
```

Get dependencies and compile dependencies
```sh
mix deps.get && mix deps.compile
```
Add compiled app to iex runtime
```sh
iex -S mix
```
IEX> Start a process
```elixir
{:ok, pid} = FbManagerNoOtp.start
```
IEX> Add some players
```elixir
FbManagerNoOtp.add_player(pid, "Russell Wilson")
FbManagerNoOtp.add_player(pid, "Doug Baldwin")
```
IEX> Remove a player
```elixir
FbManagerNoOtp.remove_player(pid, "Doug Baldwin")
```
IEX> View your fantasy team
```elixir
FbManagerNoOtp.roster(pid)
```

