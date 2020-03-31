defmodule OctoEvents.Repo.Migrations.CreateRepositories do
  use Ecto.Migration

  def change do
    create table(:repositories, primary_key: false) do
      add :id, :integer, primary_key: true
      add :issues_url, :string
      add :downloads_url, :string
      add :license, :string
      add :has_issues, :boolean, default: false
      add :assignees_url, :string
      add :teams_url, :string
      add :description, :string
      add :size, :integer
      add :private, :boolean, default: false
      add :stargazers_count, :integer
      add :git_commits_url, :string
      add :contributors_url, :string
      add :collaborators_url, :string
      add :open_issues_count, :integer
      add :archive_url, :string
      add :milestones_url, :string
      add :hooks_url, :string
      add :forks, :integer
      add :statuses_url, :string
      add :stargazers, :integer
      add :svn_url, :string
      add :fork, :boolean, default: false
      add :archived, :boolean, default: false
      add :ssh_url, :string
      add :name, :string
      add :languages_url, :string
      add :master_branch, :string
      add :events_url, :string
      add :default_branch, :string
      add :forks_url, :string
      add :deployments_url, :string
      add :subscribers_url, :string
      add :homepage, :string
      add :pulls_url, :string
      add :labels_url, :string
      add :html_url, :string
      add :issue_comment_url, :string
      add :merges_url, :string
      add :compare_url, :string
      add :has_downloads, :boolean, default: false
      add :tags_url, :string
      add :watchers_count, :integer
      add :notifications_url, :string
      add :has_pages, :boolean, default: false
      add :has_wiki, :boolean, default: false
      add :full_name, :string
      add :blobs_url, :string
      add :disabled, :boolean, default: false
      add :branches_url, :string
      add :mirror_url, :string
      add :keys_url, :string
      add :open_issues, :integer
      add :git_url, :string
      add :issue_events_url, :string
      add :has_projects, :boolean, default: false
      add :git_refs_url, :string
      add :clone_url, :string
      add :trees_url, :string
      add :forks_count, :integer
      add :node_id, :string
      add :stargazers_url, :string
      add :contents_url, :string
      add :subscription_url, :string
      add :watchers, :integer
      add :pushed_at, :utc_datetime
      add :updated_at, :utc_datetime
      add :git_tags_url, :string
      add :language, :string
      add :created_at, :utc_datetime
      add :releases_url, :string
      add :url, :string
      add :commits_url, :string
      add :comments_url, :string
      add :owner_id, references(:users)
      timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
    end
    create unique_index(:repositories, [:owner_id])
  end
end
