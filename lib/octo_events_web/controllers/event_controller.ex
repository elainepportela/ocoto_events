defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents.EventRepo
  alias OctoEventsWeb.EventView

  def create(conn, params) do
    EventView.format_params_event(params)
    |> EventRepo.insert_event()
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "")
  end

  def show(conn, params) do
    events = EventRepo.get_by_issue_id(params["issue_id"])
    render(conn, "show.json", events: events)
  end

end
