defmodule JustGames.Repo.Migrations.CreateSpace do
  use Ecto.Migration

  def change do
    create table(:spaces) do
      add :game_id, :integer
      add :name, :string
      add :required, :boolean, default: false
      add :player, :boolean, default: false
      add :secret, :boolean, default: false
      add :piece_reversible, :boolean, default: false
      add :piece_rotatable, :boolean, default: false
      add :piece_organizable, :boolean, default: false
      add :piece_swap, :boolean, default: false
      add :piece_overlap, :float, default: 0.0
      add :height, :float
      add :width, :float
      add :padding, :float
      add :shape, :string
      add :coordinates, :string
      add :anchor, :string

      timestamps()
    end

    create index(:spaces, [:game_id])

  end
end
