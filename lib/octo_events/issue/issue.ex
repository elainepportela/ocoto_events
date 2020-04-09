defmodule OctoEvents.Issue do
  use Ecto.Schema
  alias OctoEvents.Event

  @primary_key {:id, :integer, []}
  schema "issues" do
    field :title, :string
    field :state, :string
    field :body, :string
    field :created_at, :utc_datetime
    field :closed_at, :utc_datetime

    has_one :event, Event

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
