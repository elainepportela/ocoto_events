defmodule OctoEventsWeb.IssuesView do
  use OctoEventsWeb, :view

  alias OctoEvents.{Repo, Issue}
  import Ecto.Query, only: [from: 2]

  def recupera_issue(issue_id) do
    query = from i in Issue, where: i.id == ^issue_id
    issue_complet = Repo.all(query, preload: [:assignees, :labels, :user])
    issue_complet = Repo.preload(issue_complet, [:assignees, :labels, :event, :user])
    issue_complet
  end
end
