defmodule JustGames.AreaTest do
  use JustGames.ModelCase

  alias JustGames.Area

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Area.changeset(%Area{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Area.changeset(%Area{}, @invalid_attrs)
    refute changeset.valid?
  end
end
