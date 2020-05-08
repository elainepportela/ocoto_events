defmodule OctoEvents.ListEvent do
  alias OctoEvents.EventRepo

  def list_event(issue_id) do
    EventRepo.list_by_issue_id(issue_id)
  end
end
