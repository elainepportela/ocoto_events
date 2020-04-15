defmodule OctoEvents.IssueRepo do

  import Ecto.Changeset
  alias OctoEvents.{Repo, Issue}

  def creation_changeset(issue, params) do
    issue
    |> cast(params, [:id, :title, :state, :body, :created_at, :closed_at])
    |> unique_constraint(:issues_pkey, message: "Issue ja inserido, não precisa inserir de novo!")
  end

  def insert(changeset) do
    case Repo.insert changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, issue} -> issue
      {:error, errors} ->
        IO.puts("Failed insert Issue. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_issue(params) do
    %Issue{}
    |> creation_changeset(params)
    |> insert()
  end

end
