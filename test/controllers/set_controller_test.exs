defmodule JustGames.SetControllerTest do
  use JustGames.ConnCase

  alias JustGames.Set
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, set_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, set_path(conn, :new)
    assert html_response(conn, 200) =~ "New set"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, set_path(conn, :create), set: @valid_attrs
    assert redirected_to(conn) == set_path(conn, :index)
    assert Repo.get_by(Set, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, set_path(conn, :create), set: @invalid_attrs
    assert html_response(conn, 200) =~ "New set"
  end

  test "shows chosen resource", %{conn: conn} do
    set = Repo.insert! %Set{}
    conn = get conn, set_path(conn, :show, set)
    assert html_response(conn, 200) =~ "Show set"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, set_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    set = Repo.insert! %Set{}
    conn = get conn, set_path(conn, :edit, set)
    assert html_response(conn, 200) =~ "Edit set"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    set = Repo.insert! %Set{}
    conn = put conn, set_path(conn, :update, set), set: @valid_attrs
    assert redirected_to(conn) == set_path(conn, :show, set)
    assert Repo.get_by(Set, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    set = Repo.insert! %Set{}
    conn = put conn, set_path(conn, :update, set), set: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit set"
  end

  test "deletes chosen resource", %{conn: conn} do
    set = Repo.insert! %Set{}
    conn = delete conn, set_path(conn, :delete, set)
    assert redirected_to(conn) == set_path(conn, :index)
    refute Repo.get(Set, set.id)
  end
end
