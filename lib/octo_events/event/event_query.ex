defmodule OctoEvents.EventQuery do

  import Ecto.Changeset
  alias OctoEvents.{Repo, Event, IssueQuery}
  import Ecto.Query, only: [from: 2]

  def set_event(issue, event, params) do
    event
    |> cast(params, [:action])
    |> put_assoc(:issue, issue)
  end

  def insert_event(event_changeset) do
    case Repo.insert event_changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, event} -> event
      {:error, errors} ->
        IO.puts("Failed insert Event. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_event(params) do
    IssueQuery.set_insert_issue(params["issue"])
    |> set_event(%Event{}, params)
    |> insert_event()
  end

  def get_events_by_issue_id(issue_id) do
    query = from e in Event, where: e.issue_id == ^issue_id
    Repo.all(query, preload: [:issue])
    |> Repo.preload([:issue])
  end

end
