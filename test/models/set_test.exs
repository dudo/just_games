defmodule JustGames.SetTest do
  use JustGames.ModelCase

  alias JustGames.Set

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Set.changeset(%Set{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Set.changeset(%Set{}, @invalid_attrs)
    refute changeset.valid?
  end
end
