  defmodule CauzzipayWeb.UsersView do
    alias Cauzzipay.User

    def render("create.json", %{user: %User{
        account: %Cauzzipay.Account{
          id: account_id,
          balance: balance
        },
        id: id,
        name: name,
        nickname: nickname
      }
    }) do
      %{
        message: "User created",
        user: %{
          account: %{
            account_id: account_id,
            balance: balance
          },
          id: id,
          name: name,
          nickname: nickname
        }
      }
    end
  end
