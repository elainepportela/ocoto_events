defmodule OctoEvents.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "user" do
    field :avatar_url, :string
    field :events_url, :string
    field :followers_url, :string
    field :following_url, :string
    field :gists_url, :string
    field :gravatar_id, :string
    field :html_url, :string
    field :login, :string
    field :node_id, :string
    field :organizations_url, :string
    field :received_events_url, :string
    field :repos_url, :string
    field :site_admin, :boolean, default: false
    field :starred_url, :string
    field :subscriptions_url, :string
    field :type, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:login, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
    |> validate_required([:login, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
  end
end
