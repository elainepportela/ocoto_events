Mimic.copy(OctoEvents.EventRepo)
Mimic.copy(OctoEvents.EventDomain)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(OctoEvents.Repo, :manual)
