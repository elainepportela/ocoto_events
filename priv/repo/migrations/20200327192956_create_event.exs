defmodule OctoEvents.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :action, :string
      add :issue_id, references(:issues)
      add :repository_id, references(:repositories)
      add :sender_id, references(:users)

      timestamps([{:inserted_at, :inserted_at}, {:updated_at, false}])
    end

    create unique_index(:events, [:issue_id, :repository_id, :sender_id])
  end
end
