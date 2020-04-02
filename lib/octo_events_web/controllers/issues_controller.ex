defmodule OctoEventsWeb.IssuesController do
  use OctoEventsWeb, :controller

  alias OctoEventsWeb.IssuesView

  def recupera(conn, params) do
    issue = IssuesView.recupera_issue(params["issue_id"])
    pretty_json(conn, issue)
  end

  def pretty_json(conn, data) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Poison.encode!(data, pretty: true))
  end
end
