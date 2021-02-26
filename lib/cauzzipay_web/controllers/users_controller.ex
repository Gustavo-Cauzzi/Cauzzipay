defmodule CauzzipayWeb.UsersController do
  use CauzzipayWeb, :controller

  alias Cauzzipay.User

  action_fallback CauzzipayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Cauzzipay.create_user(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user)
    end
  end
end
