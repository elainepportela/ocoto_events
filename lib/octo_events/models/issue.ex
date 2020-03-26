defmodule OctoEvents.Issue do
  use Ecto.Schema

  alias OctoEvents.{User, Label}

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
    field :created_at, :time
    field :updated_at, :time
    field :closed_at, :time
    field :author_association, :string
    field :body, :string

    many_to_many :labels, Label, join_through: "labels_issue"
    many_to_many :assignees, User, join_through: "assignees_issue"
    belongs_to :user, User

  end
end
