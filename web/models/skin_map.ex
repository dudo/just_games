defmodule JustGames.SkinMap do
  use JustGames.Web, :model

  embedded_schema do
    field :area, :integer
    field :spaces, :map
    field :pieces, :map
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
