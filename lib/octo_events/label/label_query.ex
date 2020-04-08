defmodule OctoEvents.LabelQuery do

  import Ecto.Changeset
  alias OctoEvents.{Repo, Label}

  @required_fields ~w(id name)a
  @optional_fields ~w(color default description node_id url)a

  def set_label(label, params) do
    label
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:id, message: "Label ja inserido, não precisa inserir de novo!")
  end

  def insert_label(label_changeset) do
    case Repo.insert label_changeset, on_conflict: {:replace_all_except, [:inserted_at]}, conflict_target: :id do
      {:ok, label} -> label
      {:error, errors} ->
        IO.puts("Failed insert label. Error:")
        IO.inspect(errors)
    end
  end

  def set_insert_label(params) do
    set_label(%Label{}, params)
    |> insert_label()
  end
end
