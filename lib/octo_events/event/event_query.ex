defmodule OctoEvents.EventQuery do
  use Ecto.Schema
  import Ecto.Changeset

  alias OctoEvents.{Repo, Event}
  alias OctoEvents.{UserQuery, IssueQuery, RepositoryQuery}

  @required_fields ~w(action)a

  defp set_event(event, params, sender, repository, issue) do
    event
    |> cast(params, @required_fields)
    |> put_assoc(:sender, sender)
    |> put_assoc(:repository, repository)
    |> put_assoc(:issue, issue)
  end

  def insert_event(event_chagenset) do
    case Repo.insert event_chagenset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, event} -> event
      {:error, errors} ->
        IO.puts("Failed insert event. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_event(params) do
    sender = UserQuery.set_insert_user(params["sender"])
    repository = RepositoryQuery.set_insert_repository(params["repository"])
    issue = IssueQuery.set_insert_issue(params["issue"])
    set_event(%Event{}, params, sender, repository, issue)
    |> insert_event()
  end
end
