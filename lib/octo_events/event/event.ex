defmodule OctoEvents.Event do
  use Ecto.Schema

  alias OctoEvents.{User, Issue, Repository}

  @derive {Poison.Encoder, only: [:action, :issue, :sender, :repository]}
  @primary_key {:id, :integer, []}
  schema "events" do
    field :action, :string
    belongs_to :issue, Issue
    belongs_to :sender, User
    belongs_to :repository, Repository

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
