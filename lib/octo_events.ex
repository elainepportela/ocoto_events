defmodule OctoEvents do
  alias OctoEvents.{CreateEvent, ListEvents}

  defdelegate create_event(params), to: CreateEvent, as: :run
  defdelegate list_events(issue_id), to: ListEvents, as: :run
end
