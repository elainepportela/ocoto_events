
defmodule OctoEvents.Event do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "events" do
    field :action, :string
    field :login_user, :string
    field :issue_id, :integer
    field :title, :string
    field :state, :string
    field :body, :string
    field :created_at, :utc_datetime
    field :closed_at, :utc_datetime

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
