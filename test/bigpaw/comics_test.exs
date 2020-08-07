defmodule Bigpaw.ComicsTest do
  use Bigpaw.DataCase

  alias Bigpaw.Comics

  describe "comic_page" do
    alias Bigpaw.Comics.ComicPage

    @valid_attrs %{content_body: "some content_body", extra_css: "some extra_css", extra_html: "some extra_html", images: [], post_on: ~N[2010-04-17 14:00:00], posted: true, slug: "some slug", title: "some title"}
    @update_attrs %{content_body: "some updated content_body", extra_css: "some updated extra_css", extra_html: "some updated extra_html", images: [], post_on: ~N[2011-05-18 15:01:01], posted: false, slug: "some updated slug", title: "some updated title"}
    @invalid_attrs %{content_body: nil, extra_css: nil, extra_html: nil, images: nil, post_on: nil, posted: nil, slug: nil, title: nil}

    def comic_page_fixture(attrs \\ %{}) do
      {:ok, comic_page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Comics.create_comic_page()

      comic_page
    end

    test "list_comic_page/0 returns all comic_page" do
      comic_page = comic_page_fixture()
      assert Comics.list_comic_page() == [comic_page]
    end

    test "get_comic_page!/1 returns the comic_page with given id" do
      comic_page = comic_page_fixture()
      assert Comics.get_comic_page!(comic_page.id) == comic_page
    end

    test "create_comic_page/1 with valid data creates a comic_page" do
      assert {:ok, %ComicPage{} = comic_page} = Comics.create_comic_page(@valid_attrs)
      assert comic_page.content_body == "some content_body"
      assert comic_page.extra_css == "some extra_css"
      assert comic_page.extra_html == "some extra_html"
      assert comic_page.images == []
      assert comic_page.post_on == ~N[2010-04-17 14:00:00]
      assert comic_page.posted == true
      assert comic_page.slug == "some slug"
      assert comic_page.title == "some title"
    end

    test "create_comic_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Comics.create_comic_page(@invalid_attrs)
    end

    test "update_comic_page/2 with valid data updates the comic_page" do
      comic_page = comic_page_fixture()
      assert {:ok, %ComicPage{} = comic_page} = Comics.update_comic_page(comic_page, @update_attrs)
      assert comic_page.content_body == "some updated content_body"
      assert comic_page.extra_css == "some updated extra_css"
      assert comic_page.extra_html == "some updated extra_html"
      assert comic_page.images == []
      assert comic_page.post_on == ~N[2011-05-18 15:01:01]
      assert comic_page.posted == false
      assert comic_page.slug == "some updated slug"
      assert comic_page.title == "some updated title"
    end

    test "update_comic_page/2 with invalid data returns error changeset" do
      comic_page = comic_page_fixture()
      assert {:error, %Ecto.Changeset{}} = Comics.update_comic_page(comic_page, @invalid_attrs)
      assert comic_page == Comics.get_comic_page!(comic_page.id)
    end

    test "delete_comic_page/1 deletes the comic_page" do
      comic_page = comic_page_fixture()
      assert {:ok, %ComicPage{}} = Comics.delete_comic_page(comic_page)
      assert_raise Ecto.NoResultsError, fn -> Comics.get_comic_page!(comic_page.id) end
    end

    test "change_comic_page/1 returns a comic_page changeset" do
      comic_page = comic_page_fixture()
      assert %Ecto.Changeset{} = Comics.change_comic_page(comic_page)
    end
  end
end
