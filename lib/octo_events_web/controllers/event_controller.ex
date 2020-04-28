defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents.EventDomain

  def create(conn, params) do
    case EventDomain.create_event params do
      { :ok, _ } ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "")
      { :error, _ } ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(500, "")
    end
  end

  def show(conn, params) do
    events = params["issue_id"]
    |> EventDomain.get_event()
    render(conn, "show.json", events: events)
  end

end
