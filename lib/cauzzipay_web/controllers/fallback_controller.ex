defmodule CauzzipayWeb.FallbackController do
  use CauzzipayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(CauzzipayWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
