defmodule BigpawWeb.ComicPageLiveTest do
  use BigpawWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Bigpaw.Comics

  @create_attrs %{content_body: "some content_body", extra_css: "some extra_css", extra_html: "some extra_html", images: [], post_on: ~N[2010-04-17 14:00:00], posted: true, slug: "some slug", title: "some title"}
  @update_attrs %{content_body: "some updated content_body", extra_css: "some updated extra_css", extra_html: "some updated extra_html", images: [], post_on: ~N[2011-05-18 15:01:01], posted: false, slug: "some updated slug", title: "some updated title"}
  @invalid_attrs %{content_body: nil, extra_css: nil, extra_html: nil, images: nil, post_on: nil, posted: nil, slug: nil, title: nil}

  defp fixture(:comic_page) do
    {:ok, comic_page} = Comics.create_comic_page(@create_attrs)
    comic_page
  end

  defp create_comic_page(_) do
    comic_page = fixture(:comic_page)
    %{comic_page: comic_page}
  end

  describe "Index" do
    setup [:create_comic_page]

    test "lists all comic_page", %{conn: conn, comic_page: comic_page} do
      {:ok, _index_live, html} = live(conn, Routes.comic_page_index_path(conn, :index))

      assert html =~ "Listing Comic page"
      assert html =~ comic_page.content_body
    end

    test "saves new comic_page", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.comic_page_index_path(conn, :index))

      assert index_live |> element("a", "New Comic page") |> render_click() =~
               "New Comic page"

      assert_patch(index_live, Routes.comic_page_index_path(conn, :new))

      assert index_live
             |> form("#comic_page-form", comic_page: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#comic_page-form", comic_page: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.comic_page_index_path(conn, :index))

      assert html =~ "Comic page created successfully"
      assert html =~ "some content_body"
    end

    test "updates comic_page in listing", %{conn: conn, comic_page: comic_page} do
      {:ok, index_live, _html} = live(conn, Routes.comic_page_index_path(conn, :index))

      assert index_live |> element("#comic_page-#{comic_page.id} a", "Edit") |> render_click() =~
               "Edit Comic page"

      assert_patch(index_live, Routes.comic_page_index_path(conn, :edit, comic_page))

      assert index_live
             |> form("#comic_page-form", comic_page: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#comic_page-form", comic_page: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.comic_page_index_path(conn, :index))

      assert html =~ "Comic page updated successfully"
      assert html =~ "some updated content_body"
    end

    test "deletes comic_page in listing", %{conn: conn, comic_page: comic_page} do
      {:ok, index_live, _html} = live(conn, Routes.comic_page_index_path(conn, :index))

      assert index_live |> element("#comic_page-#{comic_page.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#comic_page-#{comic_page.id}")
    end
  end

  describe "Show" do
    setup [:create_comic_page]

    test "displays comic_page", %{conn: conn, comic_page: comic_page} do
      {:ok, _show_live, html} = live(conn, Routes.comic_page_show_path(conn, :show, comic_page))

      assert html =~ "Show Comic page"
      assert html =~ comic_page.content_body
    end

    test "updates comic_page within modal", %{conn: conn, comic_page: comic_page} do
      {:ok, show_live, _html} = live(conn, Routes.comic_page_show_path(conn, :show, comic_page))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Comic page"

      assert_patch(show_live, Routes.comic_page_show_path(conn, :edit, comic_page))

      assert show_live
             |> form("#comic_page-form", comic_page: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#comic_page-form", comic_page: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.comic_page_show_path(conn, :show, comic_page))

      assert html =~ "Comic page updated successfully"
      assert html =~ "some updated content_body"
    end
  end
end
