defmodule CauzzipayWeb.AccountsController do
  use CauzzipayWeb, :controller

  alias Cauzzipay.Account
  alias Cauzzipay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback CauzzipayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = user} <- Cauzzipay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: user)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = user} <- Cauzzipay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: user)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Cauzzipay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
