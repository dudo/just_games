defmodule JustGames.Action do
  use JustGames.Web, :model

  embedded_schema do
    field :piece_id, :integer
    field :user_id, :integer
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
