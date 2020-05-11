defmodule OctoEvents.ListEvents do
  alias OctoEvents.EventRepo

  def run(issue_id) do
    EventRepo.list_by(%{issue_id: issue_id})
  end
end
