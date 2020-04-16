defmodule OctoEventsWeb.EventView do
  use OctoEventsWeb, :view

  def issue_to_json(issue) do
    Map.take(issue, [:title, :state, :created_at, :closed_at, :body])
  end

  def event_to_json(event) do
    Map.take(event, [:issue_id, :action])
    |> Map.put_new(:issue, issue_to_json(event.issue))
  end
end
