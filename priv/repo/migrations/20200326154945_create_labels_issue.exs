defmodule OctoEvents.Repo.Migrations.CreateLabelsIssue do
  use Ecto.Migration

  def change do
    create table(:labels_issue) do
      add :label_id, references (:labels)
      add :issue_id, references (:issues)
    end

    create unique_index(:labels_issue, [:label_id, :issue_id])
  end
end
