defmodule JustGames.PieceTest do
  use JustGames.ModelCase

  alias JustGames.Piece

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Piece.changeset(%Piece{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Piece.changeset(%Piece{}, @invalid_attrs)
    refute changeset.valid?
  end
end
