defmodule OctoEventsWeb.EventController do
  use OctoEventsWeb, :controller

  alias OctoEvents

  def create(conn, params) do
    case OctoEvents.create_event(params) do
      {:ok, changeset} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, Poison.encode!(changeset, pretty: true))

      {:error, changeset} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(422, Poison.encode!(changeset, pretty: true))
    end
  end

  def show(conn, params) do
    events =
      params["issue_id"]
      |> OctoEvents.list_event()

    render(conn, "show.json", events: events)
  end
end
