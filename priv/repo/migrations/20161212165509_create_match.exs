defmodule JustGames.Repo.Migrations.CreateMatch do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add :game_id, :integer
      add :winner_id, :integer
      add :skin_map, :map
      add :state_map, {:array, :map}, default: []

      timestamps()
    end

    create index(:matches, [:game_id])
    create index(:matches, [:winner_id])

  end
end
