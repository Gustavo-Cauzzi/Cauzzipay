defmodule Cauzzipay do
  alias Cauzzipay.Users.Create, as: CreateUser

  alias Cauzzipay.Accounts.{Deposit, Withdraw, Transaction}

  defdelegate create_user(params), to: CreateUser, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
