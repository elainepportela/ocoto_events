defmodule OctoEvents.IssueQuery do

  import Ecto.Changeset
  alias OctoEvents.{Repo, Issue}

  def set_issue(issue, params) do
    issue
    |> cast(params, [:id, :title, :state, :body, :created_at, :closed_at])
    |> unique_constraint(:id, message: "Issue ja inserido, não precisa inserir de novo!")
  end

  def insert_issue(issue_changeset) do
    case Repo.insert issue_changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, issue} -> issue
      {:error, errors} ->
        IO.puts("Failed insert Issue. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_issue(params) do
    set_issue(%Issue{}, params)
    |> insert_issue()
  end

end
