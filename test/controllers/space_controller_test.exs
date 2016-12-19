defmodule JustGames.SpaceControllerTest do
  use JustGames.ConnCase

  alias JustGames.Space
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, space_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing spaces"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, space_path(conn, :new)
    assert html_response(conn, 200) =~ "New space"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, space_path(conn, :create), space: @valid_attrs
    assert redirected_to(conn) == space_path(conn, :index)
    assert Repo.get_by(Space, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, space_path(conn, :create), space: @invalid_attrs
    assert html_response(conn, 200) =~ "New space"
  end

  test "shows chosen resource", %{conn: conn} do
    space = Repo.insert! %Space{}
    conn = get conn, space_path(conn, :show, space)
    assert html_response(conn, 200) =~ "Show space"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, space_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    space = Repo.insert! %Space{}
    conn = get conn, space_path(conn, :edit, space)
    assert html_response(conn, 200) =~ "Edit space"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    space = Repo.insert! %Space{}
    conn = put conn, space_path(conn, :update, space), space: @valid_attrs
    assert redirected_to(conn) == space_path(conn, :show, space)
    assert Repo.get_by(Space, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    space = Repo.insert! %Space{}
    conn = put conn, space_path(conn, :update, space), space: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit space"
  end

  test "deletes chosen resource", %{conn: conn} do
    space = Repo.insert! %Space{}
    conn = delete conn, space_path(conn, :delete, space)
    assert redirected_to(conn) == space_path(conn, :index)
    refute Repo.get(Space, space.id)
  end
end
