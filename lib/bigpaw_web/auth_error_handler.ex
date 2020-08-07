defmodule BigpawWeb.AuthErrorHandler do
  use BigpawWeb, :controller
  alias Plug.Conn

  @spec call(Conn.t(), :not_authenticated) :: Conn.t()
  def call(conn, :not_authenticated) do
    conn
    |> resp(:found, "go away")
  end
end
