defmodule OctoEvents.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias OctoEvents.{Issue, Repository, Event}

  @primary_key {:id, :integer, []}
  schema "users" do
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

    has_many :issues, Issue
    has_many :repositories, Repository
    has_many :events, Event

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
  def changeset(user,  params) do
    user
    |> cast(params, [:login, :id, :node_id, :avatar_url, :gravatar_id, :url, :html_url, :followers_url, :following_url, :gists_url, :starred_url, :subscriptions_url, :organizations_url, :repos_url, :events_url, :received_events_url, :type, :site_admin])
    |> validate_required([:login, :id, :node_id, :avatar_url, :url, :type, :site_admin])
    |> unique_constraint(:id, message: "Usuario ja inserido, não precisa inserir de novo!")
  end
end
