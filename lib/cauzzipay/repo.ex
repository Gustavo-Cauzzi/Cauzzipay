defmodule Cauzzipay.Repo do
  use Ecto.Repo,
    otp_app: :cauzzipay,
    adapter: Ecto.Adapters.Postgres
end
