defmodule OctoEvents.Issue do
  use Ecto.Schema
  alias OctoEvents.{User, Label, Event}

  @derive {Poison.Encoder, only: [:labels, :assignees, :user, :url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body]}
  @primary_key {:id, :integer, []}
  schema "issues" do
    field :url, :string
    field :repository_url, :string
    field :labels_url, :string
    field :comments_url, :string
    field :events_url, :string
    field :html_url, :string
    field :node_id, :string
    field :number, :integer
    field :title, :string
    field :state, :string
    field :locked, :boolean
    field :milestone, :string
    field :comments, :integer
    field :created_at, :utc_datetime
    field :updated_at, :utc_datetime
    field :closed_at, :utc_datetime
    field :author_association, :string
    field :body, :string

    many_to_many :labels, Label, join_through: "labels_issue"
    many_to_many :assignees, User, join_through: "assignees_issue"
    belongs_to :user, User

    has_one :event, Event

    timestamps([{:inserted_at,:inserted_at}, {:updated_at, false}])
  end
end
