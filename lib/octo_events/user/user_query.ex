defmodule OctoEvents.UserQuery do

  import Ecto.Changeset
  alias OctoEvents.Repo

  @required_fields ~w(login id url type site_admin)a
  @optional_fields ~w(node_id avatar_url gravatar_id url html_url followers_url following_url gists_url starred_url subscriptions_url organizations_url repos_url events_url received_events_url)a

  def set_user(user, params) do
    { :ok, usuario } = user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:id, message: "Usuario ja inserido, não precisa inserir de novo!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    usuario
  end
end
