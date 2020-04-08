defmodule OctoEventsWeb.IssuesController do
  use OctoEventsWeb, :controller

  alias OctoEvents.IssueQuery

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
