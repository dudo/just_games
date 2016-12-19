defmodule JustGames.User do
  use JustGames.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :admin, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :admin])
    |> validate_required([:name, :email])
  end
end
