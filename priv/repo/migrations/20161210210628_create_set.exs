defmodule JustGames.Repo.Migrations.CreateSet do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :name, :string
      add :pieces_random, :boolean, default: false

      timestamps()
    end

  end
end
