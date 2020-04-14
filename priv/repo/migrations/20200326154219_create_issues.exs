defmodule OctoEvents.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      add :id, :integer, primary_key: true
      add :title, :string
      add :state, :string
      add :body, :string
      add :created_at, :utc_datetime
      add :closed_at, :utc_datetime

      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end
  end
end
