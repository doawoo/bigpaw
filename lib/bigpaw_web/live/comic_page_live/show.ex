defmodule BigpawWeb.ComicPageLive.Show do
  use BigpawWeb, :live_view

  alias Bigpaw.Comics

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:comic_page, Comics.get_comic_page!(id))}
  end

  defp page_title(:show), do: "Show Comic page"
  defp page_title(:edit), do: "Edit Comic page"
end
