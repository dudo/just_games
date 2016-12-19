defmodule JustGames.State do
  use JustGames.Web, :model

  embedded_schema do
    field :description, :string
    embeds_many :actions, JustGames.Action
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
