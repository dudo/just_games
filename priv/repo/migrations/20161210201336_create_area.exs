defmodule JustGames.Repo.Migrations.CreateArea do
  use Ecto.Migration

  def change do
    create table(:areas) do
      add :name, :string
      add :height, :float
      add :width, :float
      add :padding, :float
      add :shape, :string

      timestamps()
    end

  end
end
