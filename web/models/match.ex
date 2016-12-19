defmodule JustGames.Match do
  use JustGames.Web, :model

  schema "matches" do
    embeds_one :skin_map, JustGames.SkinMap
    embeds_many :state_map, JustGames.State

    belongs_to :game, JustGames.Game
    belongs_to :winner, JustGames.User

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
