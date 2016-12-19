defmodule JustGames.SkinControllerTest do
  use JustGames.ConnCase

  alias JustGames.Skin
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, skin_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing skins"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, skin_path(conn, :new)
    assert html_response(conn, 200) =~ "New skin"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, skin_path(conn, :create), skin: @valid_attrs
    assert redirected_to(conn) == skin_path(conn, :index)
    assert Repo.get_by(Skin, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, skin_path(conn, :create), skin: @invalid_attrs
    assert html_response(conn, 200) =~ "New skin"
  end

  test "shows chosen resource", %{conn: conn} do
    skin = Repo.insert! %Skin{}
    conn = get conn, skin_path(conn, :show, skin)
    assert html_response(conn, 200) =~ "Show skin"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, skin_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    skin = Repo.insert! %Skin{}
    conn = get conn, skin_path(conn, :edit, skin)
    assert html_response(conn, 200) =~ "Edit skin"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    skin = Repo.insert! %Skin{}
    conn = put conn, skin_path(conn, :update, skin), skin: @valid_attrs
    assert redirected_to(conn) == skin_path(conn, :show, skin)
    assert Repo.get_by(Skin, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    skin = Repo.insert! %Skin{}
    conn = put conn, skin_path(conn, :update, skin), skin: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit skin"
  end

  test "deletes chosen resource", %{conn: conn} do
    skin = Repo.insert! %Skin{}
    conn = delete conn, skin_path(conn, :delete, skin)
    assert redirected_to(conn) == skin_path(conn, :index)
    refute Repo.get(Skin, skin.id)
  end
end
