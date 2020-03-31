defmodule OctoEvents.Repository do
  use Ecto.Schema

  alias OctoEvents.{User, Event}
  import Ecto.Changeset


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
  def changeset(repository, params) do
    repository
    |> cast(params, [:id, :node_id, :name, :full_name, :private, :html_url, :description, :fork, :url, :forks_url, :keys_url, :collaborators_url, :teams_url, :hooks_url, :issue_events_url, :events_url, :assignees_url, :branches_url, :tags_url, :blobs_url, :git_tags_url, :git_refs_url, :trees_url, :statuses_url, :languages_url, :stargazers_url, :contributors_url, :subscribers_url, :subscription_url, :commits_url, :git_commits_url, :comments_url, :issue_comment_url, :contents_url, :compare_url, :merges_url, :archive_url, :downloads_url, :issues_url, :pulls_url, :milestones_url, :notifications_url, :labels_url, :releases_url, :deployments_url, :created_at, :updated_at, :pushed_at, :git_url, :ssh_url, :clone_url, :svn_url, :homepage, :size, :stargazers_count, :watchers_count, :language, :has_issues, :has_projects, :has_downloads, :has_wiki, :has_pages, :forks_count, :mirror_url, :archived, :disabled, :open_issues_count, :license, :forks, :open_issues, :watchers, :default_branch])
    |> cast_assoc(:owner, with: &User.changeset/2)
    |> unique_constraint(:id, message: "Repo ja inserido, não precisa inserir de novo!")
  end
end
