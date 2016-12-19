defmodule JustGames.SkinTest do
  use JustGames.ModelCase

  alias JustGames.Skin

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Skin.changeset(%Skin{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Skin.changeset(%Skin{}, @invalid_attrs)
    refute changeset.valid?
  end
end
