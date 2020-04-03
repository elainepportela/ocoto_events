defmodule OctoEvents.LabelQuery do

  import Ecto.Changeset
  alias OctoEvents.Repo

  @required_fields ~w(id name)a
  @optional_fields ~w(color default description node_id url)a

  def set_label(label, params) do
    { :ok, etiqueta } = label
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:id, message: "Label ja inserido, não precisa inserir de novo!")
    |> Repo.insert(on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id)
    etiqueta
  end
end
