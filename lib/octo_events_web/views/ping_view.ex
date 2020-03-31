defmodule OctoEventsWeb.PingView do
  use OctoEventsWeb, :view

  import Ecto.Changeset
  alias OctoEvents.{User, Repo, Event, Issue, Repository}

  def salvar_evento(_evento=["issues"], params) do
    evento = Event.changeset(%Event{}, params)
    save = Event.save_event(evento)
    IO.inspect(save)
    # evento =
    #   %Event{}
    #   |> cast(params, [:action])
    #   |> cast_assoc(:issue, with: &Issue.changeset/2)
    #   |> cast_assoc(:repository, with: &Repository.changeset/2)
    #   |> cast_assoc(:sender, with: &User.changeset/2)
    IO.inspect(evento)

    # issue =
    #   %Issue{}
    #   |> cast(params["issue"], [:url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :user, :labels, :state, :locked, :assignee, :assignees, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body])
    # IO.inspect(issue)
    # repository =
    #   %Repository{}
    #   |> cast(params["repository"], [:id, :node_id, :name, :full_name, :private, :owner, :html_url, :description, :fork, :url, :forks_url, :keys_url, :collaborators_url, :teams_url, :hooks_url, :issue_events_url, :events_url, :assignees_url, :branches_url, :tags_url, :blobs_url, :git_tags_url, :git_refs_url, :trees_url, :statuses_url, :languages_url, :stargazers_url, :contributors_url, :subscribers_url, :subscription_url, :commits_url, :git_commits_url, :comments_url, :issue_comment_url, :contents_url, :compare_url, :merges_url, :archive_url, :downloads_url, :issues_url, :pulls_url, :milestones_url, :notifications_url, :labels_url, :releases_url, :deployments_url, :created_at, :updated_at, :pushed_at, :git_url, :ssh_url, :clone_url, :svn_url, :homepage, :size, :stargazers_count, :watchers_count, :language, :has_issues, :has_projects, :has_downloads, :has_wiki, :has_pages, :forks_count, :mirror_url, :archived, :disabled, :open_issues_count, :license, :forks, :open_issues, :watchers, :default_branch])
    # IO.inspect(repository)
    # sender =
    #   %User{}
    #   |> cast(params, [:sender])
    # IO.inspect(sender)
    # evento =
    #   %Event{}
    #   |> cast(params, [:action])
    #   |> validate_required([:action])
    # IO.inspect(evento)
    # {:ok, _struct} = Repo.insert(sender, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
  end

  def salvar_evento(evento, _params) do
    IO.puts("no errado")
  end
end
