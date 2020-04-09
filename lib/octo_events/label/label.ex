defmodule OctoEvents.Label do
  use Ecto.Schema

  alias OctoEvents.Issue

  @primary_key {:id, :integer, []}
  schema "labels" do
    field :color, :string
    field :default, :boolean, default: false
    field :description, :string
    field :name, :string
    field :node_id, :string
    field :url, :string

    many_to_many :issues, Issue, join_through: "labels_issue"

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
