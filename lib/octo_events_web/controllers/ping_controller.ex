defmodule OctoEventsWeb.PingController do
  use OctoEventsWeb, :controller

  def ping(conn, params) do
    sender = params["hook"]["user"]
    sender
    render(conn, "index.html")
  end
end
