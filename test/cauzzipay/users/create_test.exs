defmodule Cauzzipay.Users.CreateTest do
  use Cauzzipay.DataCase, async: true

  alias Cauzzipay.User
  alias Cauzzipay.Users.Create

  describe "call/1" do
    test "when all params are valid, it should return an user" do
      params =%{
        name: "Gustavo",
        password: "123456",
        nickname: "Gustavo",
        email: "gustavo@email.com",
        age: 18
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Gustavo", age: 18, id: ^user_id} = user
    end

    test "when there are invalid params, it should return error" do
      params =%{
        name: "Gustavo",
        nickname: "Gustavo",
        email: "gustavo@email.com",
        age: 17
      } #No password and under 18

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
