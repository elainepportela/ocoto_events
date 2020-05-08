defmodule OctoEvents do

  alias OctoEvents.{CreateEvent, ListEvent}

  defdelegate create_event(params), to: CreateEvent
  defdelegate list_event(issue_id), to: ListEvent

end
