defmodule OctoEvents.EventQuery do
  use Ecto.Schema
  import Ecto.Changeset

  alias OctoEvents.{Repo, User, Issue, Repository, Event}
  alias OctoEvents.{UserQuery, IssueQuery, RepositoryQuery}

  @required_fields ~w(action)a

  defp set_event(event, params, sender, repository, issue) do
    { :ok, evento } = event
    |> cast(params, @required_fields)
    |> put_assoc(:sender, sender)
    |> put_assoc(:repository, repository)
    |> put_assoc(:issue, issue)
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    evento
  end

  def insert_event(params) do
    sender = UserQuery.set_user(%User{}, params["sender"])
    repository = RepositoryQuery.set_repository(%Repository{}, params["repository"])
    issue = IssueQuery.set_issue(%Issue{}, params["issue"])
    event = set_event(%Event{}, params, sender, repository, issue)
    event
  end
end
