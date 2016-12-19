defmodule JustGames.Game do
  use JustGames.Web, :model

  schema "games" do
    field :name, :string
    field :min_players, :integer
    field :max_players, :integer

    belongs_to :area, JustGames.Area
    has_many :spaces, JustGames.Space
    belongs_to :set, JustGames.Set
    embeds_one :initial_state_map, JustGames.State

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :min_players, :max_players])
    |> validate_required([:name])
  end
end
