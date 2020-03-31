defmodule OctoEvents.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :integer, primary_key: true
      add :avatar_url, :string, null: false
      add :events_url, :string
      add :followers_url, :string
      add :following_url, :string
      add :gists_url, :string
      add :gravatar_id, :string
      add :html_url, :string
      add :login, :string, null: false
      add :node_id, :string, null: false
      add :organizations_url, :string
      add :received_events_url, :string
      add :repos_url, :string
      add :site_admin, :boolean, default: false
      add :starred_url, :string
      add :subscriptions_url, :string
      add :type, :string, null: false
      add :url, :string, null: false
      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end
  end
end
