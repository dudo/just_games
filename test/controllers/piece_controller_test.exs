defmodule JustGames.PieceControllerTest do
  use JustGames.ConnCase

  alias JustGames.Piece
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, piece_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pieces"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, piece_path(conn, :new)
    assert html_response(conn, 200) =~ "New piece"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, piece_path(conn, :create), piece: @valid_attrs
    assert redirected_to(conn) == piece_path(conn, :index)
    assert Repo.get_by(Piece, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, piece_path(conn, :create), piece: @invalid_attrs
    assert html_response(conn, 200) =~ "New piece"
  end

  test "shows chosen resource", %{conn: conn} do
    piece = Repo.insert! %Piece{}
    conn = get conn, piece_path(conn, :show, piece)
    assert html_response(conn, 200) =~ "Show piece"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, piece_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    piece = Repo.insert! %Piece{}
    conn = get conn, piece_path(conn, :edit, piece)
    assert html_response(conn, 200) =~ "Edit piece"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    piece = Repo.insert! %Piece{}
    conn = put conn, piece_path(conn, :update, piece), piece: @valid_attrs
    assert redirected_to(conn) == piece_path(conn, :show, piece)
    assert Repo.get_by(Piece, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    piece = Repo.insert! %Piece{}
    conn = put conn, piece_path(conn, :update, piece), piece: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit piece"
  end

  test "deletes chosen resource", %{conn: conn} do
    piece = Repo.insert! %Piece{}
    conn = delete conn, piece_path(conn, :delete, piece)
    assert redirected_to(conn) == piece_path(conn, :index)
    refute Repo.get(Piece, piece.id)
  end
end
