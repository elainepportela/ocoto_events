defmodule OctoEvents.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :action, :string
      add :issue, references(:issues)
      add :repository, references(:repositories)
      add :sender, references(:users)

      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end

    create unique_index(:events, [:issue])
    create unique_index(:events, [:repository])
    create unique_index(:events, [:sender])
  end
end
