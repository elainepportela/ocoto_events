defmodule OctoEvents.Repo.Migrations.CreateLabels do
  use Ecto.Migration

  def change do
    create table(:labels, primary_key: false) do
      add :id, :integer, primary_key: true
      add :color, :string
      add :default, :boolean, default: false
      add :description, :string
      add :name, :string
      add :node_id, :string
      add :url, :string

      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end
  end
end
