defmodule BigpawWeb.ComicPageLive.FormComponent do
  use BigpawWeb, :live_component

  alias Bigpaw.Comics

  @impl true
  def update(%{comic_page: comic_page} = assigns, socket) do
    changeset = Comics.change_comic_page(comic_page)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"comic_page" => comic_page_params}, socket) do
    changeset =
      socket.assigns.comic_page
      |> Comics.change_comic_page(comic_page_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"comic_page" => comic_page_params}, socket) do
    save_comic_page(socket, socket.assigns.action, comic_page_params)
  end

  defp save_comic_page(socket, :edit, comic_page_params) do
    case Comics.update_comic_page(socket.assigns.comic_page, comic_page_params) do
      {:ok, _comic_page} ->
        {:noreply,
         socket
         |> put_flash(:info, "Comic page updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_comic_page(socket, :new, comic_page_params) do
    case Comics.create_comic_page(comic_page_params) do
      {:ok, _comic_page} ->
        {:noreply,
         socket
         |> put_flash(:info, "Comic page created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
