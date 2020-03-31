defmodule OctoEvents.Event do
  use Ecto.Schema

  alias OctoEvents.{User, Issue, Repository, Repo}
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  schema "events" do
    field :action, :string
    belongs_to :issue, Issue
    belongs_to :sender, User
    belongs_to :repository, Repository

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end

  def changeset(event, params) do
    event
    |> cast(params, [:action])
    |> cast_assoc(:issue, with: &Issue.changeset/2)
    |> cast_assoc(:repository, with: &Repository.changeset/2)
    |> cast_assoc(:sender, with: &User.changeset/2)
  end

  def save_event(event) do
    issue = insert_issue(get_field(event, :issue))
    IO.inspect(issue)
    repository = insert_repository(get_field(event, :repository))
    sender = Repo.insert!(get_field(event, :sender), on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)

    event_complet = Ecto.build_assoc(issue, :events, event)
    event_complet = Ecto.build_assoc(repository, :events, event_complet)
    event_complet = Ecto.build_assoc(sender, :events, event_complet)

    save = Repo.insert!(event_complet, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)

    IO.inspect(save)
  end

  def insert_issue(issue) do
    user = Repo.insert!(issue.user, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    issue_with_user = Ecto.build_assoc(user, :issues, issue)
    Repo.insert!(issue_with_user)
  end

  def insert_repository(repository) do
    owner = Repo.insert!(repository.owner, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    repo_with_user = Ecto.build_assoc(owner, :repositories, repository)
    Repo.insert!(repo_with_user)
  end
end
