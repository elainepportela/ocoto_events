defmodule OctoEvents.EventRepo do
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias OctoEvents.{Repo, Event}

  def creation_changeset(params) do
    %Event{}
    |> cast(params, [
      :action,
      :login_user,
      :issue_id,
      :title,
      :state,
      :body,
      :created_at,
      :closed_at
    ])
  end

  def insert(changeset) do
    changeset
    |> Repo.insert()
  end

  def list_by(%{issue_id: issue_id}) do
    query = from e in Event, where: e.issue_id == ^issue_id
    Repo.all(query)
  end
end
