defmodule OctoEvents.Commit do
  use Ecto.Schema

  @primary_key {:id, :string, autogenerate: false}
  @foreign_key_type :string
  schema "commits" do
    field :added, {:array, :string}
    field :author, :map
    field :committer, :map
    field :distinct, :string
    field :message, :string
    field :modified, {:array, :string}
    field :removed, {:array, :string}
    field :timestamp, :time
    field :tree_id, :string
    field :url, :string

    timestamps()
  end
end
