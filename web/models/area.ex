defmodule JustGames.Area do
  use JustGames.Web, :model

  schema "areas" do
    field :name, :string
    field :height, :float
    field :width, :float
    field :padding, :float
    field :shape, :string

    has_many :skins, {"areas_skins", JustGames.Skin}, foreign_key: :assoc_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :height, :width, :padding, :shape])
    |> validate_required([:name])
  end
end
