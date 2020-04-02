defmodule OctoEventsWeb.PingView do
  use OctoEventsWeb, :view

  import Ecto.Changeset
  alias OctoEvents.{User, Repo, Event, Issue, Repository, Label}

  def salvar_evento(params) do
    sender = set_user(%User{}, params["sender"])
    repository = set_repository(%Repository{}, params["repository"])
    issue = set_issue(%Issue{}, params["issue"])
    event = set_event(%Event{}, params, sender, repository, issue)
    event
  end

  defp set_event(event, params, sender, repository, issue) do
    { :ok, evento } = event
    |> cast(params, [:action])
    |> put_assoc(:sender, sender)
    |> put_assoc(:repository, repository)
    |> put_assoc(:issue, issue)
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    evento
  end

  defp set_user(user, params) do
    { :ok, usuario } = user
    |> cast(params, [:login, :id, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
    |> unique_constraint(:id, message: "Usuario ja inserido, não precisa inserir de novo!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    usuario
  end

  defp set_label(label, params) do
    { :ok, etiqueta } = label
    |> cast(params, [:id, :color, :default, :description, :name, :node_id, :url])
    |> unique_constraint(:id, message: "Label ja inserido, não precisa inserir de novo!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    etiqueta
  end

  defp set_repository(repository, params) do
    owner = set_user(%User{}, params["owner"])
    { :ok, repositorio } = repository
    |> cast(params, [:id, :node_id, :name, :full_name, :private, :html_url, :description, :fork, :url, :forks_url, :keys_url, :collaborators_url, :teams_url, :hooks_url, :issue_events_url, :events_url, :assignees_url, :branches_url, :tags_url, :blobs_url, :git_tags_url, :git_refs_url, :trees_url, :statuses_url, :languages_url, :stargazers_url, :contributors_url, :subscribers_url, :subscription_url, :commits_url, :git_commits_url, :comments_url, :issue_comment_url, :contents_url, :compare_url, :merges_url, :archive_url, :downloads_url, :issues_url, :pulls_url, :milestones_url, :notifications_url, :labels_url, :releases_url, :deployments_url, :created_at, :updated_at, :pushed_at, :git_url, :ssh_url, :clone_url, :svn_url, :homepage, :size, :stargazers_count, :watchers_count, :language, :has_issues, :has_projects, :has_downloads, :has_wiki, :has_pages, :forks_count, :mirror_url, :archived, :disabled, :open_issues_count, :license, :forks, :open_issues, :watchers, :default_branch])
    |> put_assoc(:owner, owner)
    |> unique_constraint(:id, message: "Repositorio ja inserido!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    repositorio
  end

  defp set_issue(issue, params) do
    user = set_user(%User{}, params["user"])
    labels = []
    labels = List.insert_at(labels, -1, (for label <- params["labels"], do: set_label(%Label{}, label)))
    assignees = []
    assignees = List.insert_at(assignees, -1, (for assignee <- params["assignees"], do: set_user(%User{}, assignee)))
    { :ok, issue } = issue
    |> cast(params, [:url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body])
    |> put_assoc(:user, user)
    |> unique_constraint(:id, message: "Issue ja inserido")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    issue = Repo.preload(issue, [:assignees, :labels, :event])
    set_assignees(issue, hd assignees)
    set_labels(issue, hd labels)
    issue
  end

  defp set_labels(issue, lista_labels) do
    issue_changeset = Ecto.Changeset.change(issue)
    labels_issue = issue_changeset
    |> Ecto.Changeset.put_assoc(:labels, lista_labels)
    Repo.insert(labels_issue, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  defp set_assignees(issue, lista_assignees) do
    issue_changeset = Ecto.Changeset.change(issue)
    assignees_issue = issue_changeset
    |> Ecto.Changeset.put_assoc(:assignees, lista_assignees)
    valor = Repo.insert(assignees_issue, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    IO.inspect(valor)
  end
end
