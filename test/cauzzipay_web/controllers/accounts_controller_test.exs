defmodule CauzzipayWeb.AccountsControllerTest do
  use CauzzipayWeb.ConnCase, async: true # Em testes de controller, usar ConnCase

  alias Cauzzipay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Gustavo",
        password: "123456",
        nickname: "Gustavo",
        email: "gustavo@email.com",
        age: 18
      }

      {:ok, %User{account: %Account{id: account_id}}} = Cauzzipay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic dXNlcm5hbWU6cGFzc3dvcmQ=")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, it should make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{
          "account_id" => _uselessId,
          "balance" => "50.00"
          },
        "message" => "Account updated successfully"
      } = response
    end

    test "when there are invalid params, it should return an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "invalid_value"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!" }

      assert response == expected_response
    end
  end
end
