defmodule CauzzipayWeb.WelcomeController do
  use CauzzipayWeb, :controller

  alias Cauzzipay.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_all_numbers_from_file()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{
      message:
        "Welcome to Cauzzipay API. Here's the number that you requested: #{result}"
      })
  end
  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
