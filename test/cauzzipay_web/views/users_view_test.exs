defmodule CauzzipayWeb.UsersViewTest do
  use CauzzipayWeb.ConnCase, async: true

  import Phoenix.View # para poder user o render()

  alias Cauzzipay.{Account, User}
  alias CauzzipayWeb.UsersView

  test "renders create.json" do
    params =%{
      name: "Gustavo",
      password: "123456",
      nickname: "Gustavo",
      email: "gustavo@email.com",
      age: 18
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Cauzzipay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          account_id: account_id,
          balance: Decimal.new("0.00")
        },
        id: user_id,
        name: "Gustavo",
        nickname: "Gustavo"
      }
    }

    assert expected_response == response
  end
end
