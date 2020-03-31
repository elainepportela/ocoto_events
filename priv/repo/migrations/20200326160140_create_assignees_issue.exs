defmodule OctoEvents.Repo.Migrations.CreateAssigneesIssue do
  use Ecto.Migration

  def change do
    create table(:assignees_issue) do
      add :user_id, references (:users)
      add :issue_id, references (:issues)
      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end

    create unique_index(:assignees_issue, [:user_id, :issue_id])
  end
end
