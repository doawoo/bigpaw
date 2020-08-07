defmodule Bigpaw.Comics do
  @moduledoc """
  The Comics context.
  """

  import Ecto.Query, warn: false
  alias Bigpaw.Repo

  alias Bigpaw.Comics.ComicPage

  @doc """
  Returns the list of comic_page.

  ## Examples

      iex> list_comic_page()
      [%ComicPage{}, ...]

  """
  def list_comic_page do
    Repo.all(ComicPage)
  end

  @doc """
  Gets a single comic_page.

  Raises `Ecto.NoResultsError` if the Comic page does not exist.

  ## Examples

      iex> get_comic_page!(123)
      %ComicPage{}

      iex> get_comic_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comic_page!(id), do: Repo.get!(ComicPage, id)

  @doc """
  Creates a comic_page.

  ## Examples

      iex> create_comic_page(%{field: value})
      {:ok, %ComicPage{}}

      iex> create_comic_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comic_page(attrs \\ %{}) do
    %ComicPage{}
    |> ComicPage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comic_page.

  ## Examples

      iex> update_comic_page(comic_page, %{field: new_value})
      {:ok, %ComicPage{}}

      iex> update_comic_page(comic_page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comic_page(%ComicPage{} = comic_page, attrs) do
    comic_page
    |> ComicPage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comic_page.

  ## Examples

      iex> delete_comic_page(comic_page)
      {:ok, %ComicPage{}}

      iex> delete_comic_page(comic_page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comic_page(%ComicPage{} = comic_page) do
    Repo.delete(comic_page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comic_page changes.

  ## Examples

      iex> change_comic_page(comic_page)
      %Ecto.Changeset{data: %ComicPage{}}

  """
  def change_comic_page(%ComicPage{} = comic_page, attrs \\ %{}) do
    ComicPage.changeset(comic_page, attrs)
  end
end
