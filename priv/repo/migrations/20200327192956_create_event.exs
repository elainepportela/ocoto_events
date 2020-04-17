defmodule OctoEvents.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :action, :string
      add :login_user, :string
      add :issue_id, :integer
      add :title, :string
      add :state, :string
      add :body, :string
      add :created_at, :utc_datetime
      add :closed_at, :utc_datetime

      timestamps([{:inserted_at, :inserted_at}, {:updated_at, false}])
    end
  end
end
