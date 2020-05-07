defmodule OctoEventsWeb.EventView do
  use OctoEventsWeb, :view

  def render("show.json", %{events: events}) do
    %{data: render_many(events, OctoEventsWeb.EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    Map.drop(event, [:__struct__, :__meta__])
  end
end
