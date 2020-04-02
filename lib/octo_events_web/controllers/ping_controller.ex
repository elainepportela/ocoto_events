defmodule OctoEventsWeb.PingController do
  use OctoEventsWeb, :controller

  alias OctoEventsWeb.{PingView, IssuesView}

  def ping(conn, params) do
    evento = PingView.salvar_evento(params)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "")
  end
end
