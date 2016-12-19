defmodule JustGames.Space do
  use JustGames.Web, :model

  schema "spaces" do
    field :name, :string
    field :required, :boolean
    field :player, :boolean
    field :secret, :boolean
    field :height, :float
    field :width, :float
    field :padding, :float
    field :shape, :string
    field :coordinates, :string
    field :anchor, :string

    # How do the pieces behave while in the space?
    field :piece_reversible, :boolean
    field :piece_rotatable, :boolean
    field :piece_organizable, :boolean # drag and drop pieces within space
    field :piece_swap, :boolean # exchange piece when conflict
    field :piece_overlap, :float # percentage seen when overlapping pieces, -1 for free form

    belongs_to :game, JustGames.Game
    has_many :skins, {"spaces_skins", JustGames.Skin}, foreign_key: :assoc_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :required, :player, :secret, :height, :width, :padding, :shape, :coordinates, :anchor, :piece_reversible, :piece_rotatable, :piece_organizable, :piece_swap, :piece_overlap])
    |> validate_required([:name])
  end
end