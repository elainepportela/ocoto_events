Mimic.copy(OctoEvents.EventRepo)
Mimic.copy(OctoEvents.ListEvents)
Mimic.copy(OctoEvents.CreateEvent)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(OctoEvents.Repo, :manual)
