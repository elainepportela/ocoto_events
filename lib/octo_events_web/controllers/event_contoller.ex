defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents.{EventQuery, IssueQuery}

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
    issue = IssueQuery.get_issue(params["issue_id"])
    pretty_json(conn, issue)
  end

  def pretty_json(conn, data) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(data, pretty: true))
  end
end
