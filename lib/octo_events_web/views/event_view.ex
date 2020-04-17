defmodule OctoEventsWeb.EventView do
  use OctoEventsWeb, :view

  def format_params_event(params) do
    %{
      action: params["action"],
      login_user: params["issue"]["user"]["login"],
      issue_id: params["issue"]["id"],
      title: params["issue"]["title"],
      state: params["issue"]["state"],
      body: params["issue"]["body"],
      created_at: params["issue"]["created_at"],
      closed_at: params["issue"]["closed_at"],
    }
  end

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
      login_user: event.login_user,
      issue_id: event.issue_id,
      title: event.title,
      state: event.state,
      body: event.body,
      created_at: event.created_at,
      closed_at: event.closed_at,
    }
  end

end
