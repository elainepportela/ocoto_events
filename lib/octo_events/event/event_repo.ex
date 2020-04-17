defmodule OctoEvents.EventRepo do

  import Ecto.Changeset
  alias OctoEvents.{Repo, Event}
  import Ecto.Query, only: [from: 2]

  def creation_changeset(event, params) do
    event
    |> cast(params, [:action, :login_user, :issue_id, :title, :state, :body, :created_at, :closed_at])
  end

  def insert(changeset) do
    case Repo.insert changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, event} -> event
      {:error, errors} ->
        IO.puts("Failed insert Event. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_event(params) do
    %Event{}
    |> creation_changeset(params)
    |> insert()
  end

  def get_by_issue_id(issue_id) do
    query = from e in Event, where: e.issue_id == ^issue_id
    Repo.all(query)
  end


end
