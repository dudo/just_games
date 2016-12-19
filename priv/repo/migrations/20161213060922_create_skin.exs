defmodule JustGames.Repo.Migrations.CreateSkin do
  use Ecto.Migration

  def change do
    create table(:areas_skins) do
      add :assoc_id, :integer
      add :name, :string
      add :image_url, :string
    end

    create table(:spaces_skins) do
      add :assoc_id, :integer
      add :name, :string
      add :image_url, :string
    end

    create table(:pieces_skins) do
      add :assoc_id, :integer
      add :name, :string
      add :image_url, :string
    end

    create index(:areas_skins, [:assoc_id])
    create index(:areas_skins, [:name])

    create index(:spaces_skins, [:assoc_id])
    create index(:spaces_skins, [:name])

    create index(:pieces_skins, [:assoc_id])
    create index(:pieces_skins, [:name])

  end
end
