defmodule OctoEvents.IssueQuery do
  import Ecto.Changeset
  alias OctoEvents.{Issue, Repo, UserQuery, LabelQuery}
  import Ecto.Query, only: [from: 2]

  @required_fields ~w(url id title created_at body)a
  @optional_fields ~w(repository_url labels_url comments_url events_url html_url node_id number state locked milestone comments updated_at closed_at author_association)a

  def set_issue(issue, params, user) do
    issue
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> put_assoc(:user, user)
    |> unique_constraint(:id, message: "Issue ja inserido")
  end

  def insert_issue(issue_changeset) do
    case Repo.insert issue_changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, issue} -> issue
      {:error, errors} ->
        IO.puts("Failed insert issue. Error:")
        IO.inspect(errors)
    end
  end

  defp set_labels(issue, lista_labels) do
    issue_changeset = Ecto.Changeset.change(issue)
    labels_issue = issue_changeset
    |> Ecto.Changeset.put_assoc(:labels, lista_labels)
    Repo.insert(labels_issue, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  defp set_assignees(issue, lista_assignees) do
    issue_changeset = Ecto.Changeset.change(issue)
    assignees_issue = issue_changeset
    |> Ecto.Changeset.put_assoc(:assignees, lista_assignees)
    Repo.insert(assignees_issue, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  def set_insert_issue(params) do
    labels = []
    labels = List.insert_at(labels, -1, (for label <- params["labels"], do: LabelQuery.set_insert_label(label)))
    assignees = []
    assignees = List.insert_at(assignees, -1, (for assignee <- params["assignees"], do: UserQuery.set_insert_user(assignee)))
    user = UserQuery.set_insert_user(params["user"])
    issue = set_issue(%Issue{}, params, user)
    |> insert_issue()
    |> Repo.preload([:assignees, :labels, :event])
    set_assignees(issue, hd assignees)
    set_labels(issue, hd labels)
    issue
  end

  def get_issue(id) do
    query = from i in Issue, where: i.id == ^id
    Repo.all(query, preload: [:assignees, :labels, :user])
    |> Repo.preload([:assignees, :labels, :event, :user])
  end
end
