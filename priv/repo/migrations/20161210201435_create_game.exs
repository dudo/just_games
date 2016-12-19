defmodule JustGames.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :area_id, :integer
      add :set_id, :integer
      add :name, :string
      add :min_players, :integer
      add :max_players, :integer
      add :initial_state_map, :map

      timestamps()
    end

    create index(:games, [:area_id])
    create index(:games, [:set_id])
    create index(:games, [:name])

  end
end
