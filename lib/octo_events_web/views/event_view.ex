defmodule OctoEventsWeb.EventView do
  use OctoEventsWeb, :view

  def issue_to_json(issue) do
    {json, _ } = issue
    |> Enum.at(0)
    |> Map.split([:labels, :assignees, :user, :url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body])
    json
  end
end
