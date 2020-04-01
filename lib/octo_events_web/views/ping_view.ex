defmodule OctoEventsWeb.PingView do
  use OctoEventsWeb, :view

  import Ecto.Changeset
  alias OctoEvents.{User, Repo, Event, Issue, Repository}

  def salvar_evento(params) do
    { :ok, sender } = set_user(%User{}, params["sender"])
    IO.puts("primeiro")
    IO.inspect(sender)
    { :ok, repository } = set_repository(%Repository{}, params["repository"])
    IO.puts("segundo")
    IO.inspect(repository)
    { :ok, issue } = set_issue(%Issue{}, params["issue"])
    IO.puts("terceiro")
    IO.inspect(issue)
    { :ok, event } = set_event(%Event{}, params, sender, repository, issue)
    IO.puts("quarto")
    IO.inspect(event)
  end

  def set_event(event, params, sender, repository, issue) do
    event
    |> cast(params, [:action])
    |> put_assoc(:sender, sender)
    |> put_assoc(:repository, repository)
    |> put_assoc(:issue, issue)
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end
  @spec set_user(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: any
  def set_user(user, params) do
    user
    |> cast(params, [:login, :id, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
    |> unique_constraint(:id, message: "Usuario ja inserido, não precisa inserir de novo!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  def set_repository(repository, params) do
    { :ok, owner } = set_user(%User{}, params["owner"])
    repository
    |> cast(params, [:id, :node_id, :name, :full_name, :private, :html_url, :description, :fork, :url, :forks_url, :keys_url, :collaborators_url, :teams_url, :hooks_url, :issue_events_url, :events_url, :assignees_url, :branches_url, :tags_url, :blobs_url, :git_tags_url, :git_refs_url, :trees_url, :statuses_url, :languages_url, :stargazers_url, :contributors_url, :subscribers_url, :subscription_url, :commits_url, :git_commits_url, :comments_url, :issue_comment_url, :contents_url, :compare_url, :merges_url, :archive_url, :downloads_url, :issues_url, :pulls_url, :milestones_url, :notifications_url, :labels_url, :releases_url, :deployments_url, :created_at, :updated_at, :pushed_at, :git_url, :ssh_url, :clone_url, :svn_url, :homepage, :size, :stargazers_count, :watchers_count, :language, :has_issues, :has_projects, :has_downloads, :has_wiki, :has_pages, :forks_count, :mirror_url, :archived, :disabled, :open_issues_count, :license, :forks, :open_issues, :watchers, :default_branch])
    |> put_assoc(:owner, owner)
    |> unique_constraint(:id, message: "Repositorio ja inserido!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  def set_issue(issue, params) do
    {:ok, user } = set_user(%User{}, params["user"])
    issue
    |> cast(params, [:url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body])
    |> put_assoc(:user, user)
    |> unique_constraint(:id, message: "Issue ja inserido")
    # Ecto.build_assoc(user, :issues)
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  def set_user_without_save(user, params) do
    user
    |> cast(params, [:login, :id, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
  end
end
