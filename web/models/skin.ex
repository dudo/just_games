defmodule JustGames.Skin do
  use JustGames.Web, :model

  schema "abstract table: skins" do
    field :name, :string
    field :image_url, :string
    # This will be used by associations on each "concrete" table
    field :assoc_id, :integer

    timestamps()
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
