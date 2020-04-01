defmodule OctoEventsWeb.PingController do
  use OctoEventsWeb, :controller

  alias OctoEventsWeb.PingView

  def ping(conn, params) do
    # evento = get_req_header(conn, "x-github-event")
    PingView.salvar_evento(params)
    render(conn, "ping.html")
  end
end
