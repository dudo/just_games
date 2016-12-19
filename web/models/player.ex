defmodule JustGames.Player do
  use JustGames.Web, :model

  schema "players" do
    embeds_many :pieces_initial, :integer
    embeds_many :pieces_played, JustGames.PiecesPlayed

    belongs_to :user, JustGames.User
    belongs_to :match, JustGames.Match

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
