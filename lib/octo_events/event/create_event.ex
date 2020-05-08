defmodule OctoEvents.CreateEvent do
  alias OctoEvents.EventRepo

  def create_event(params) do
    format_params_event(params)
    |> EventRepo.creation_changeset()
    |> EventRepo.insert()
  end

  def format_params_event(params) do
    %{
      action: params["action"],
      login_user: params["issue"]["user"]["login"],
      issue_id: params["issue"]["id"],
      title: params["issue"]["title"],
      state: params["issue"]["state"],
      body: params["issue"]["body"],
      created_at: params["issue"]["created_at"],
      closed_at: params["issue"]["closed_at"]
    }
  end
end
