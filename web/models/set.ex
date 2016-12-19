defmodule JustGames.Set do
  use JustGames.Web, :model

  schema "sets" do
    field :name, :string
    field :pieces_random, :boolean

    has_many :pieces, JustGames.Piece

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :pieces_random])
    |> validate_required([:name])
  end
end
