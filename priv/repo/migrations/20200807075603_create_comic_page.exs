defmodule Bigpaw.Repo.Migrations.CreateComicPage do
  use Ecto.Migration

  def change do
    create table(:comic_page, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :slug, :string
      add :images, {:array, :string}
      add :post_on, :naive_datetime
      add :posted, :boolean, default: false, null: false
      add :content_body, :text
      add :extra_css, :text
      add :extra_html, :text

      timestamps()
    end

  end
end
