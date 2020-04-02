defmodule OctoEvents.Repo.Migrations.CreateLabelsIssue do
  use Ecto.Migration

  def change do
    create table(:labels_issue) do
      add :label_id, references (:labels)
      add :issue_id, references (:issues)
      timestamps([{:inserted_at, false}, {:updated_at, false}])
    end
  end
end
