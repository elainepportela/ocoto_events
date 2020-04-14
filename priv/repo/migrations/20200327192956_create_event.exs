defmodule OctoEvents.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :action, :string

      add :issue_id, references(:issues)

      timestamps([{:inserted_at, :inserted_at}, {:updated_at, false}])
    end
  end
end
