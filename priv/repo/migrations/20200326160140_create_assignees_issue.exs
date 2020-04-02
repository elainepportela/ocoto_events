defmodule OctoEvents.Repo.Migrations.CreateAssigneesIssue do
  use Ecto.Migration

  def change do
    create table(:assignees_issue) do
      add :user_id, references (:users)
      add :issue_id, references (:issues)

      timestamps([{:inserted_at, false}, {:updated_at, false}])
    end
  end
end
