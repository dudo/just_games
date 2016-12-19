defmodule JustGames.Piece do
  use JustGames.Web, :model

  schema "pieces" do
    field :name, :string
    field :variant, :string

    belongs_to :set, JustGames.Set
    has_many :skins, {"pieces_skins", JustGames.Skin}, foreign_key: :assoc_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :variant])
    |> validate_required([:name])
  end
end
