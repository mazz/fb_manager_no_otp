# FbManagerNoOtp

A small application wrapper for https://www.fantasyfootballnerd.com/. Uses the the ffnerd-api-elixir elixir API(https://github.com/jessejanderson/ffnerd-api-elixir). This application does NOT use OTP.

## Getting Started

Clone the repo locally
`git clone https://github.com/mazz/fb_manager_no_otp.git`
Get dependencies and compile dependencies
`mix deps.get && mix deps.compile`
Add compiled app to iex runtime
`iex -S mix`
IEX> Start a process
`pid = FbManagerNoOtp.start_link`
IEX> Add some players
`send(pid, {:add, "Russell Wilson"})`
`send(pid, {:add, "Doug Baldwin"})`
IEX> Remove a player
`send(pid, {:remove, "Doug Baldwin"})`
IEX> View your fantasy team
`send(pid, {:team, self})`
`flush`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fb_manager_no_otp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fb_manager_no_otp, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fb_manager_no_otp](https://hexdocs.pm/fb_manager_no_otp).

# fb_manager_no_otp
