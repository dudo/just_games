defmodule JustGames.Repo.Migrations.CreatePiece do
  use Ecto.Migration

  def change do
    create table(:pieces) do
      add :set_id, :integer
      add :name, :string
      add :variant, :string

      timestamps()
    end

    create index(:pieces, [:set_id])
    create index(:pieces, [:variant])

  end
end
