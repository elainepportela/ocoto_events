defmodule OctoEventsWeb.PingView do
  use OctoEventsWeb, :view

  alias OctoEvents.EventQuery

  def salvar_evento(params) do
    EventQuery.insert_event(params)
  end
end
