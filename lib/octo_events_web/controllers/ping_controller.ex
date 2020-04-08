defmodule OctoEventsWeb.PingController do
  use OctoEventsWeb, :controller

  alias OctoEvents.EventQuery

  def create(conn, params) do
    EventQuery.set_insert_event(params)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "")
  end
end
