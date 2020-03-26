defmodule OctoEvents.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      add :id, :integer, primary_key: true
      add :url, :string
      add :repository_url, :string
      add :labels_url, :string
      add :comments_url, :string
      add :events_url, :string
      add :html_url, :string
      add :node_id, :string
      add :number, :integer
      add :title, :string
      add :state, :string
      add :locked, :boolean
      add :milestone, :string
      add :comments, :integer
      add :created_at, :time
      add :updated_at, :time
      add :closed_at, :time
      add :author_association, :string
      add :body, :string
      add :user_id, references(:users)

    end

    create unique_index(:issues, [:user_id])

  end
end
