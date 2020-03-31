defmodule OctoEvents.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  alias OctoEvents.{User, Label, Event}

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

  def changeset(issue, params) do
    issue
    |> cast(params, [:url, :repository_url, :labels_url, :comments_url, :events_url, :html_url, :id, :node_id, :number, :title, :state, :locked, :milestone, :comments, :created_at, :updated_at, :closed_at, :author_association, :body])
    |> cast_assoc(:user, with: &User.changeset/2)
    |> cast_assoc(:labels, with: &Label.changeset/2)
    |> cast_assoc(:assignees, with: &User.changeset/2)
    |> unique_constraint(:id, message: "Issue ja inserido, não precisa inserir de novo!")
  end

  # defp convert_time(changeset) do
  #   created_at =
  #     get_field(changeset, :created_at)
  #     |> DateTime.from_iso8601
  #   updated_at =
  #     get_field(changeset, :updated_at)
  #     |> DateTime.from_iso8601
  #   closed_at =
  #     get_field(changeset, :closed_at)
  #     |> DateTime.from_iso8601
  #   IO.inspect(created_at)
  #   put_change(changeset, :created_at, created_at)
  #   put_change(changeset, :updated_at, updated_at)
  #   put_change(changeset, :closed_at, closed_at)
  # end
end
