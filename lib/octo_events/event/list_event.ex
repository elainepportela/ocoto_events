defmodule OctoEvents.ListEvent do
  alias OctoEvents.EventRepo

  def list_events(issue_id) do
    EventRepo.list_by(%{issue_id: issue_id})
  end
end
