defmodule Bigpaw.Comics.ComicPage do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comic_page" do
    field :content_body, :string
    field :extra_css, :string
    field :extra_html, :string
    field :images, {:array, :string}
    field :post_on, :naive_datetime
    field :posted, :boolean, default: false
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(comic_page, attrs) do
    comic_page
    |> cast(generation(attrs), [:title, :slug, :images, :post_on, :posted, :content_body, :extra_css, :extra_html])
    |> validate_required([:title, :slug, :images, :post_on, :posted, :content_body, :extra_css, :extra_html])
  end

  defp generation(attrs) do
    generate_slug(attrs)
  end

  defp generate_slug(%{"title" => title} = attrs) do
    slug =
      title
      |> String.replace(" ", "-")
      |> String.downcase()
    %{ attrs | "slug" => slug }
  end
  defp generate_slug(attrs), do: attrs
end
