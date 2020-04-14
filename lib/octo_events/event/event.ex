
defmodule OctoEvents.Event do
  use Ecto.Schema

  alias OctoEvents.Issue

  @primary_key {:id, :integer, []}
  schema "events" do
    field :action, :string

    belongs_to :issue, Issue

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
