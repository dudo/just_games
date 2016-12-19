defmodule JustGames.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :user_id, :integer
      add :match_id, :integer

      timestamps()
    end

    create index(:players, [:user_id])
    create index(:players, [:match_id])

  end
end
