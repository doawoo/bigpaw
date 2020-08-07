defmodule BigpawWeb.ComicPageLive.Index do
  use BigpawWeb, :live_view

  alias Bigpaw.Comics
  alias Bigpaw.Comics.ComicPage

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :comic_page_collection, list_comic_page())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Comic page")
    |> assign(:comic_page, Comics.get_comic_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Comic page")
    |> assign(:comic_page, %ComicPage{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Comic page")
    |> assign(:comic_page, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    comic_page = Comics.get_comic_page!(id)
    {:ok, _} = Comics.delete_comic_page(comic_page)

    {:noreply, assign(socket, :comic_page_collection, list_comic_page())}
  end

  defp list_comic_page do
    Comics.list_comic_page()
  end
end
