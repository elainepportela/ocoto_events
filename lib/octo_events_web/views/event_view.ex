defmodule OctoEventsWeb.EventView do
  use OctoEventsWeb, :view

  def issue_to_json(issue) do
    issue
    |> Map.take([:title, :state, :created_at, :closed_at, :body])
  end

  def render("show.json", %{events: events}) do
    %{data: render_many(events, OctoEventsWeb.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      action: event.action,
      issue_id: event.issue_id,
      issue: issue_to_json(event.issue),
    }
  end

end
