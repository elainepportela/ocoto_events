defmodule OctoEvents.User do
  use Ecto.Schema

  @primary_key {:id, :integer, autogenerate: false}
  @foreign_key_type :integer
  schema "user" do
    field :avatar_url, :string, null: false
    field :events_url, :string
    field :followers_url, :string
    field :following_url, :string
    field :gists_url, :string
    field :gravatar_id, :string
    field :html_url, :string
    field :login, :string, null: false
    field :node_id, :string, null: false
    field :organizations_url, :string
    field :received_events_url, :string
    field :repos_url, :string
    field :site_admin, :boolean, default: false
    field :starred_url, :string
    field :subscriptions_url, :string
    field :type, :string, null: false
    field :url, :string, null: false

    timestamps()
  end
end
