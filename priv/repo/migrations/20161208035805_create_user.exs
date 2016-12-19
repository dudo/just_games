defmodule JustGames.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :admin, :boolean, default: false

      timestamps()
    end

    create index(:users, [:email])

  end
end
