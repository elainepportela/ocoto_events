defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents.EventRepo
  alias OctoEventsWeb.EventView

  def create(conn, params) do
    EventRepo.set_insert_event(params)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "")
  end

  def show(conn, params) do
    EventRepo.get_by_issue_id(params["issue_id"])
    |> EventView.event_to_json()
    |> pretty_json(conn)
  end

  def pretty_json(data, conn) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(data, pretty: true))
  end

end
