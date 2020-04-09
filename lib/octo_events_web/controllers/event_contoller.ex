defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents.{EventQuery, IssueQuery}
  alias OctoEventsWeb.EventView


  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, params) do
    EventQuery.set_insert_event(params)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "")
  end

  def show(conn, params) do
    IssueQuery.get_issue(params["issue_id"])
    |> EventView.issue_to_json()
    |> pretty_json(conn)
  end

  def pretty_json(data, conn) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(data, pretty: true))
    #
  end
end
