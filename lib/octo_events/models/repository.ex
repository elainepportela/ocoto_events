defmodule OctoEvents.Repository do
  use Ecto.Schema

  alias OctoEvents.{User, Event}

  @primary_key {:id, :integer, []}
  schema "repositories" do
    field :issues_url, :string
    field :downloads_url, :string
    field :license, :string
    field :has_issues, :boolean, default: false
    field :assignees_url, :string
    field :teams_url, :string
    field :description, :string
    field :size, :integer
    field :private, :boolean, default: false
    field :stargazers_count, :integer
    field :git_commits_url, :string
    field :contributors_url, :string
    field :collaborators_url, :string
    field :open_issues_count, :integer
    field :archive_url, :string
    field :milestones_url, :string
    field :hooks_url, :string
    field :forks, :integer
    field :statuses_url, :string
    field :stargazers, :integer
    field :svn_url, :string
    field :fork, :boolean, default: false
    field :archived, :boolean, default: false
    field :ssh_url, :string
    field :name, :string
    field :languages_url, :string
    field :master_branch, :string
    field :events_url, :string
    field :default_branch, :string
    field :forks_url, :string
    field :deployments_url, :string
    field :subscribers_url, :string
    field :homepage, :string
    field :pulls_url, :string
    field :labels_url, :string
    field :html_url, :string
    field :issue_comment_url, :string
    field :merges_url, :string
    field :compare_url, :string
    field :has_downloads, :boolean, default: false
    field :tags_url, :string
    field :watchers_count, :integer
    field :notifications_url, :string
    field :has_pages, :boolean, default: false
    field :has_wiki, :boolean, default: false
    field :full_name, :string
    field :blobs_url, :string
    field :disabled, :boolean, default: false
    field :branches_url, :string
    field :mirror_url, :string
    field :keys_url, :string
    field :open_issues, :integer
    field :git_url, :string
    field :issue_events_url, :string
    field :has_projects, :boolean, default: false
    field :git_refs_url, :string
    field :clone_url, :string
    field :trees_url, :string
    field :forks_count, :integer
    field :node_id, :string
    field :stargazers_url, :string
    field :contents_url, :string
    field :subscription_url, :string
    field :watchers, :integer
    field :pushed_at, :utc_datetime
    field :updated_at, :utc_datetime
    field :git_tags_url, :string
    field :language, :string
    field :created_at, :utc_datetime
    field :releases_url, :string
    field :url, :string
    field :commits_url, :string
    field :comments_url, :string

    belongs_to :owner, User
    has_many :events, Event

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
